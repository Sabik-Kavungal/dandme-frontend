import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart' as flutter;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:drandme/modules/clinic/models/receipt_model.dart';

class PdfReceiptService {
  // --- PRODUCTION-GRADE PREMIUM PALETTE ---
  static const PdfColor ink900 = PdfColor.fromInt(0xFF0F172A); // Slate 900
  static const PdfColor ink700 = PdfColor.fromInt(0xFF334155); // Slate 700
  static const PdfColor slate500 = PdfColor.fromInt(0xFF64748B); // Slate 500
  static const PdfColor emerald500 = PdfColor.fromInt(0xFF10B981); // Emerald 500
  static const PdfColor emerald50 = PdfColor.fromInt(0xFFECFDF5); // Emerald 50
  static const PdfColor lineLight = PdfColor.fromInt(0xFFF1F5F9); // Slate 100
  static const PdfColor lineDark = PdfColor.fromInt(0xFFE2E8F0); // Slate 200
  static const PdfColor white = PdfColors.white;

  static Future<Uint8List> generateReceiptPdf(ReceiptModel receipt) async {
    final font = await PdfGoogleFonts.interRegular();
    final fontMedium = await PdfGoogleFonts.interMedium();
    final fontBold = await PdfGoogleFonts.interBold();
    final icons = await PdfGoogleFonts.materialIcons();

    pw.ImageProvider? logoImage;
    if (receipt.clinicLogoUrl != null && receipt.clinicLogoUrl!.isNotEmpty) {
      try {
        logoImage = await networkImage(receipt.clinicLogoUrl!);
      } catch (e) {
        print("Error loading clinic logo: $e");
      }
    }

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: font,
        bold: fontBold,
        italic: font,
        boldItalic: fontBold,
        fontFallback: [icons, font],
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a5,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // --- 1. POLISHED HEADER ---
              _buildPolishedHeader(receipt, fontBold, fontMedium, logoImage),
              pw.SizedBox(height: 8),
              pw.Container(height: 1, color: lineLight),
              
              pw.SizedBox(height: 16),

              // --- 2. TITLE SECTION (TIGHTENED) ---
              pw.Center(
                child: pw.Text(
                  "MEDICAL INVOICE",
                  style: pw.TextStyle(
                    fontSize: 16, 
                    font: fontBold, 
                    color: ink900,
                    letterSpacing: 3,
                  ),
                ),
              ),
              
              pw.SizedBox(height: 16),

              // --- 3. INFORMATION GRID ---
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("BILL TO", style: pw.TextStyle(fontSize: 7, font: fontBold, color: slate500, letterSpacing: 1)),
                      pw.SizedBox(height: 6),
                      pw.Text(receipt.patientName, style: pw.TextStyle(fontSize: 12, font: fontBold, color: ink900)),
                      pw.SizedBox(height: 2),
                      pw.Text(receipt.patientPhone ?? '-', style: pw.TextStyle(fontSize: 8, color: ink700)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      _buildInfoRow("Invoice No", receipt.bookingNumber, fontBold, fontMedium),
                      _buildInfoRow("Issued At", DateFormat('dd MMM yyyy • hh:mm a').format(receipt.generatedAt), fontBold, fontMedium),
                      _buildInfoRow("Visit Mode", receipt.visitMode, fontBold, fontMedium),
                      pw.SizedBox(height: 6),
                      _buildProductionBadge(receipt, fontBold),
                    ],
                  ),
                ],
              ),

              pw.SizedBox(height: 24),

              // --- 4. PREMIUM TABLE ---
              _buildPolishedTable(receipt, fontBold, fontMedium),

              pw.SizedBox(height: 16),

              // --- 5. FINANCIAL HERO ---
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Container(
                    width: 170,
                    child: pw.Column(
                      children: [
                        _buildSummaryRow("Subtotal", "INR ${receipt.consultationFee.toStringAsFixed(2)}", fontMedium, slate500),
                        _buildSummaryRow("Tax (0%)", "INR ${receipt.tax.toStringAsFixed(2)}", fontMedium, slate500),
                        pw.SizedBox(height: 6),
                        pw.Container(height: 1, color: ink900),
                        pw.SizedBox(height: 6),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: pw.BoxDecoration(
                            color: lineLight,
                            borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                          ),
                          child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text("TOTAL", style: pw.TextStyle(fontSize: 9, font: fontBold, color: ink900, letterSpacing: 0.5)),
                              pw.Text("INR ${receipt.totalAmount.toStringAsFixed(2)}", style: pw.TextStyle(fontSize: 12, font: fontBold, color: ink900)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              pw.Spacer(),

              // --- 6. POLISHED FOOTER ---
              pw.Container(height: 1, color: lineLight),
              pw.SizedBox(height: 16),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Terms and Conditions", style: pw.TextStyle(fontSize: 8, font: fontBold, color: ink900)),
                      pw.SizedBox(height: 4),
                      pw.Text("Digitally Generated Medical Document", style: pw.TextStyle(fontSize: 7, color: slate500)),
                      pw.Text("Ref: ${receipt.appointmentId.toUpperCase()}", style: pw.TextStyle(fontSize: 5, color: slate500)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text("Support: ${receipt.clinicPhone}", style: pw.TextStyle(fontSize: 7, color: ink700, font: fontMedium)),
                      pw.SizedBox(height: 2),
                      pw.Text("DR & ME HEALTHCARE CLINICAL OS", style: pw.TextStyle(fontSize: 6, color: slate500, letterSpacing: 1)),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // --- COMPONENT BUILDERS ---

  static pw.Widget _buildPolishedHeader(ReceiptModel receipt, pw.Font bold, pw.Font medium, pw.ImageProvider? logoImage) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(receipt.clinicName, style: pw.TextStyle(fontSize: 16, font: bold, color: ink900)),
            pw.SizedBox(height: 4),
            pw.Text(receipt.clinicAddress, style: pw.TextStyle(fontSize: 7, color: slate500)),
            pw.Text("Verified Healthcare Provider", style: pw.TextStyle(fontSize: 7, color: emerald500, font: medium)),
          ],
        ),
        if (logoImage != null)
          pw.Container(
            width: 40,
            height: 40,
            padding: const pw.EdgeInsets.all(2),
            decoration: pw.BoxDecoration(
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
              border: pw.Border.all(color: lineDark, width: 0.5),
            ),
            child: pw.ClipRRect(
              horizontalRadius: 4,
              verticalRadius: 4,
              child: pw.Image(logoImage, fit: pw.BoxFit.cover),
            ),
          ),
      ],
    );
  }

  static pw.Widget _buildInfoRow(String label, String value, pw.Font labelFont, pw.Font valFont) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Text(label, style: pw.TextStyle(fontSize: 7, font: labelFont, color: slate500)),
          pw.SizedBox(width: 12),
          pw.Text(value, style: pw.TextStyle(fontSize: 8, font: valFont, color: ink900)),
        ],
      ),
    );
  }

  static pw.Widget _buildProductionBadge(ReceiptModel receipt, pw.Font bold) {
    final bool isPaid = receipt.paymentStatus.toLowerCase() == 'paid';
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: pw.BoxDecoration(
        color: isPaid ? emerald50 : lineLight,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(20)),
      ),
      child: pw.Row(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Container(
            width: 4,
            height: 4,
            margin: const pw.EdgeInsets.only(right: 6),
            decoration: pw.BoxDecoration(
              color: isPaid ? emerald500 : slate500,
              shape: pw.BoxShape.circle,
            ),
          ),
          pw.Text(
            isPaid ? "PAID" : "PENDING", 
            style: pw.TextStyle(fontSize: 7, font: bold, color: isPaid ? emerald500 : ink700, letterSpacing: 0.5)
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildPolishedTable(ReceiptModel receipt, pw.Font bold, pw.Font medium) {
    return pw.Table(
      border: const pw.TableBorder(
        top: pw.BorderSide(color: ink900, width: 1.5),
        bottom: pw.BorderSide(color: ink900, width: 1),
      ),
      columnWidths: {
        0: const pw.FlexColumnWidth(3),
        1: const pw.FixedColumnWidth(60),
        2: const pw.FixedColumnWidth(60),
      },
      children: [
        // Table Header
        pw.TableRow(
          decoration: const pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: lineLight, width: 0.5))),
          children: [
            _buildTableCell("SERVICE DESCRIPTION", bold, isHeader: true),
            _buildTableCell("UNIT FEE", bold, isHeader: true, align: pw.Alignment.centerRight),
            _buildTableCell("AMOUNT", bold, isHeader: true, align: pw.Alignment.centerRight),
          ],
        ),
        // Item Row
        pw.TableRow(
          children: [
            _buildTableCell("${receipt.consultationType.toUpperCase()} CONSULTATION", medium),
            _buildTableCell(receipt.consultationFee.toStringAsFixed(2), medium, align: pw.Alignment.centerRight),
            _buildTableCell(receipt.consultationFee.toStringAsFixed(2), medium, align: pw.Alignment.centerRight),
          ],
        ),
        if (receipt.additionalCharges > 0)
          pw.TableRow(
            children: [
              _buildTableCell("ADDITIONAL CLINICAL SERVICES", medium),
              _buildTableCell(receipt.additionalCharges.toStringAsFixed(2), medium, align: pw.Alignment.centerRight),
              _buildTableCell(receipt.additionalCharges.toStringAsFixed(2), medium, align: pw.Alignment.centerRight),
            ],
          ),
      ],
    );
  }

  static pw.Widget _buildTableCell(String text, pw.Font font, {bool isHeader = false, pw.Alignment align = pw.Alignment.centerLeft}) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      alignment: align,
      child: pw.Text(text, style: pw.TextStyle(fontSize: 8, font: font, color: ink900)),
    );
  }

  static pw.Widget _buildSummaryRow(String label, String value, pw.Font font, PdfColor color) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 3),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(fontSize: 8, font: font, color: color)),
          pw.Text(value, style: pw.TextStyle(fontSize: 8, font: font, color: ink900)),
        ],
      ),
    );
  }

  // --- ACTIONS ---

  static Future<void> previewReceiptPdf(flutter.BuildContext context, ReceiptModel receipt) async {
    final pdfBytes = await generateReceiptPdf(receipt);
    await Printing.layoutPdf(onLayout: (format) async => pdfBytes, name: 'Invoice-${receipt.bookingNumber}');
  }

  static Future<String?> saveReceiptPdf(ReceiptModel receipt) async {
    try {
      final pdfBytes = await generateReceiptPdf(receipt);
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/Invoice_${receipt.bookingNumber}.pdf');
      await file.writeAsBytes(pdfBytes);
      return file.path;
    } catch (e) {
      return null;
    }
  }

  static Future<void> shareReceiptPdf(ReceiptModel receipt) async {
    try {
      final pdfBytes = await generateReceiptPdf(receipt);
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/Invoice_${receipt.bookingNumber}.pdf');
      await file.writeAsBytes(pdfBytes);
      await Share.shareXFiles([XFile(file.path)], text: 'Medical Invoice: ${receipt.bookingNumber}');
    } catch (e) {
      // Handle error
    }
  }
}

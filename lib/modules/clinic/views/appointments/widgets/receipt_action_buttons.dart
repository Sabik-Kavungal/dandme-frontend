import 'package:flutter/material.dart';
import '../../../../../core/services/pdf_receipt_service.dart';
import 'package:drandme/modules/clinic/models/receipt_model.dart';

class ReceiptActionButtons extends StatelessWidget {
  final ReceiptModel receipt;
  final bool showLabel;

  const ReceiptActionButtons({
    super.key,
    required this.receipt,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.picture_as_pdf_rounded,
                size: 18,
                color: Color(0xFF111827),
              ),
              const SizedBox(width: 8),
              const Text(
                'Receipt Options',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ActionButton(
              icon: Icons.picture_as_pdf_rounded,
              label: 'View',
              color: const Color(0xFF0F766E),
              onTap: () => PdfReceiptService.previewReceiptPdf(context, receipt),
            ),
            const SizedBox(width: 12),
            _ActionButton(
              icon: Icons.download_rounded,
              label: 'Save',
              color: const Color(0xFF4B5563),
              onTap: () async {
                final path = await PdfReceiptService.saveReceiptPdf(receipt);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(path != null ? 'Receipt saved to: $path' : 'Failed to save receipt'),
                      backgroundColor: path != null ? Colors.green : Colors.red,
                    ),
                  );
                }
              },
            ),
            const SizedBox(width: 12),
            _ActionButton(
              icon: Icons.share_rounded,
              label: 'Share',
              color: const Color(0xFF6366F1),
              onTap: () => PdfReceiptService.shareReceiptPdf(receipt),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

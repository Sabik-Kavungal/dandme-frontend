import 'package:flutter/material.dart';

/// A premium, high-fidelity patient profile cell with avatar, name, and phone
/// Optimized for clinical scannability and 10/10 aesthetic.
class DashboardPatientCell extends StatelessWidget {
  final String? patientName;
  final String? phoneNumber;

  const DashboardPatientCell({
    super.key,
    required this.patientName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Identity Box (Slate-50 Standard)
        _buildIdentityBox(patientName),
        const SizedBox(width: 12),
        // Name and Phone Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Patient Name Row
              Row(
                children: [
                  const Icon(
                    Icons.person_rounded,
                    size: 14,
                    color: Color(0xFF334155), // Slate 700
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      patientName ?? 'Unknown Patient',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A), // Slate 900
                        letterSpacing: -0.3,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Phone Chip - Premium clinical look
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9), // Slate 100
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.phone_rounded,
                      size: 11,
                      color: Color(0xFF64748B), // Slate 500
                    ),
                    const SizedBox(width: 5),
                    Text(
                      phoneNumber ?? 'No Phone',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF475569), // Slate 600
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIdentityBox(String? name) {
    final String initial = name != null && name.isNotEmpty ? name[0].toUpperCase() : 'P';
    
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Slate 50
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE2E8F0), // Slate 200
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          initial,
          style: const TextStyle(
            color: Color(0xFF475569), // Slate 600
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}


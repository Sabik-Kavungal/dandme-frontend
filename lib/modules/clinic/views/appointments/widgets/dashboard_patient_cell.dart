import 'package:flutter/material.dart';

/// A reusable patient profile cell with avatar, name, and phone
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
        // Profile Icon (Circular)
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: const Icon(Icons.person, size: 12, color: Color(0xFF666666)),
        ),
        const SizedBox(width: 6),
        // Name and Phone
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                patientName ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.phone, size: 8, color: Color(0xFF10B981)),
                  const SizedBox(width: 3),
                  Flexible(
                    child: Text(
                      phoneNumber ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

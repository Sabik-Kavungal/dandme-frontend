import 'package:flutter/material.dart';
import 'package:a/modules/clinic/viewmodels/appointments/appointment_dashboard_viewmodel.dart';
import 'dashboard_summary_card.dart';

/// Dashboard summary cards section showing appointment statistics
class DashboardSummarySection extends StatelessWidget {
  final AppointmentDashboardViewModel viewModel;
  final BoxConstraints constraints;

  const DashboardSummarySection({
    super.key,
    required this.viewModel,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final summary = viewModel.summary;
    final isMobile = constraints.maxWidth < 768;

    if (isMobile) {
      return _buildMobileLayout(summary);
    } else {
      return _buildDesktopLayout(summary);
    }
  }

  /// Build mobile layout (2x2 grid)
  Widget _buildMobileLayout(dynamic summary) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DashboardSummaryCard(
                value:
                    '${viewModel.confirmedCount + viewModel.pendingCount + viewModel.arrivedCount}',
                label: 'Today\'s Appointments',
                baseColor: const Color(0xFFB088F0),
                icon: Icons.calendar_today,
                constraints: constraints,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DashboardSummaryCard(
                value: '${viewModel.arrivedCount}',
                label: 'Arrived Patients',
                baseColor: const Color(0xFFBFEAF5),
                icon: Icons.how_to_reg,
                constraints: constraints,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            Expanded(
              child: DashboardSummaryCard(
                value: '${viewModel.completedCount}',
                label: 'Completed Appointments',
                baseColor: const Color(0xFFB0F0B0),
                icon: Icons.check_circle,
                constraints: constraints,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DashboardSummaryCard(
                value: '${viewModel.cancelledOrNoShowCount}',
                label: 'Cancelled Appointment with No Show',
                baseColor: const Color(0xFFF0B0B0),
                icon: Icons.cancel,
                constraints: constraints,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build desktop layout (horizontal row)
  Widget _buildDesktopLayout(dynamic summary) {
    return Row(
      children: [
        Expanded(
          child: DashboardSummaryCard(
            value:
                '${viewModel.confirmedCount + viewModel.pendingCount + viewModel.arrivedCount}',
            label: 'Today\'s Appointments',
            baseColor: const Color(0xFFB088F0),
            icon: Icons.calendar_today,
            constraints: constraints,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DashboardSummaryCard(
            value: '${viewModel.arrivedCount}',
            label: 'Arrived Patients',
            baseColor: const Color(0xFFBFEAF5),
            icon: Icons.how_to_reg,
            constraints: constraints,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DashboardSummaryCard(
            value: '${viewModel.completedCount}',
            label: 'Completed Appointments',
            baseColor: const Color(0xFFB0F0B0),
            icon: Icons.check_circle,
            constraints: constraints,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DashboardSummaryCard(
            value: '${viewModel.cancelledOrNoShowCount}',
            label: 'Cancelled Appointment with No Show',
            baseColor: const Color(0xFFF0B0B0),
            icon: Icons.cancel,
            constraints: constraints,
          ),
        ),
      ],
    );
  }
}

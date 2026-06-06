import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drandme/modules/clinic/models/doctor_time_slot_model.dart';
import 'package:drandme/modules/clinic/viewmodels/slot_configuration_viewmodel.dart';
import 'package:drandme/modules/auth/viewmodels/auth_viewmodel.dart';

class SlotConfigurationWidget extends StatefulWidget {
  final String? doctorId; // Optional - auto-fetched from auth if not provided
  final String? clinicId; // Optional - auto-fetched from auth if not provided
  final VoidCallback? onSlotsCreated;

  const SlotConfigurationWidget({
    super.key,
    this.doctorId,
    this.clinicId,
    this.onSlotsCreated,
  });

  @override
  State<SlotConfigurationWidget> createState() =>
      _SlotConfigurationWidgetState();
}

class _SlotConfigurationWidgetState extends State<SlotConfigurationWidget> {
  String _slotType = 'clinic_visit';
  List<SlotInput> _slots = [];

  void _addSlot() {
    setState(() {
      _slots.add(
        SlotInput(
          startTime: '09:00',
          endTime: '12:00',
          maxPatients: 10,
          notes: '',
        ),
      );
    });
  }

  void _removeSlot(int index) {
    setState(() {
      _slots.removeAt(index);
    });
  }

  void _updateSlot(int index, SlotInput slot) {
    setState(() {
      _slots[index] = slot;
    });
  }

  void _resetForm() {
    setState(() {
      _slots.clear();
      _slotType = 'clinic_visit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Icon(Icons.schedule, size: 20, color: Color(0xFF333333)),
              const SizedBox(width: 8),
              const Text(
                'Create Time Slots',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Slot Type Selection
          _buildSlotTypeSelector(),
          const SizedBox(height: 16),

          // Slots List
          if (_slots.isEmpty) _buildEmptyState() else _buildSlotsList(),

          const SizedBox(height: 16),

          // Add Slot Button
          OutlinedButton.icon(
            onPressed: _addSlot,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add Time Slot'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2196F3),
              side: const BorderSide(color: Color(0xFF2196F3)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSlotTypeSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildSlotTypeButton('clinic_visit', '🏥 Clinic Visit'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildSlotTypeButton(
              'video_consultation',
              '💻 Video Consultation',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotTypeButton(String type, String label) {
    final isSelected = _slotType == type;
    return InkWell(
      onTap: () => setState(() => _slotType = type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2196F3) : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.access_time, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              'No time slots added',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Click "Add Time Slot" to create slots',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotsList() {
    return Column(
      children: [
        for (int i = 0; i < _slots.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildSlotCard(i),
          ),
      ],
    );
  }

  Widget _buildSlotCard(int index) {
    final slot = _slots[index];
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with slot number and delete button
          Row(
            children: [
              Text(
                'Slot ${index + 1}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _removeSlot(index),
                icon: const Icon(Icons.close, size: 18),
                color: Colors.red,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Time inputs
          Row(
            children: [
              Expanded(
                child: _buildTimeInput(
                  label: 'Start Time',
                  value: slot.startTime,
                  onChanged: (value) =>
                      _updateSlot(index, slot.copyWith(startTime: value)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTimeInput(
                  label: 'End Time',
                  value: slot.endTime,
                  onChanged: (value) =>
                      _updateSlot(index, slot.copyWith(endTime: value)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Max patients
          _buildNumberInput(
            label: 'Max Patients',
            value: slot.maxPatients,
            onChanged: (value) =>
                _updateSlot(index, slot.copyWith(maxPatients: value)),
          ),
          const SizedBox(height: 12),

          // Notes
          _buildTextInput(
            label: 'Notes (Optional)',
            value: slot.notes,
            onChanged: (value) =>
                _updateSlot(index, slot.copyWith(notes: value)),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInput({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: TextField(
            controller: TextEditingController(text: value)
              ..selection = TextSelection.collapsed(offset: value.length),
            onChanged: onChanged,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              hintText: '00:00',
              hintStyle: TextStyle(fontSize: 14, color: Color(0xFF999999)),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildNumberInput({
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: TextField(
            controller: TextEditingController(text: value.toString())
              ..selection = TextSelection.collapsed(
                offset: value.toString().length,
              ),
            onChanged: (v) {
              final parsed = int.tryParse(v);
              if (parsed != null && parsed > 0) onChanged(parsed);
            },
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              hintText: '10',
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: TextField(
            controller: TextEditingController(text: value)
              ..selection = TextSelection.collapsed(offset: value.length),
            onChanged: onChanged,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              hintText: 'Enter notes...',
              hintStyle: TextStyle(fontSize: 14, color: Color(0xFF999999)),
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Consumer<SlotConfigurationViewModel>(
      builder: (context, viewModel, child) {
        final isCreating = viewModel.isCreating;

        return Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isCreating ? null : _resetForm,
                icon: const Icon(Icons.refresh, size: 16),
                label: const Text('Reset'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF666666),
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: isCreating ? null : _createSlots,
                icon: isCreating
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Icon(Icons.add, size: 16),
                label: Text(isCreating ? 'Creating...' : 'Create Slots'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _createSlots() async {
    // Validation
    if (_slots.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one time slot'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Get doctor and clinic IDs
    final authViewModel = context.read<AuthViewModel>();
    final doctorId = widget.doctorId ?? authViewModel.user?.id;
    final clinicId = widget.clinicId ?? authViewModel.user?.clinicId;

    // Validate IDs
    if (doctorId == null || doctorId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Doctor ID not found. Please log in again.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (clinicId == null || clinicId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Clinic ID not found. Please assign clinic.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Convert to SimpleTimeSlot
    final slots = _slots
        .map(
          (slot) => SimpleTimeSlot(
            startTime: slot.startTime,
            endTime: slot.endTime,
            maxPatients: slot.maxPatients,
            notes: slot.notes.isEmpty ? null : slot.notes,
          ),
        )
        .toList();

    // Call ViewModel
    final viewModel = context.read<SlotConfigurationViewModel>();
    final response = await viewModel.createDateSpecificSlots(
      doctorId: doctorId,
      clinicId: clinicId,
      slotType: _slotType,
      selectedDate: DateTime.now(), // Using current date as default
      slots: slots,
    );

    if (!mounted) return;

    if (response != null && response.totalCreated > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ Created ${response.totalCreated} time slots'),
          backgroundColor: Colors.green,
        ),
      );
      widget.onSlotsCreated?.call();
      _resetForm();
    } else {
      final errorMsg = viewModel.error.isNotEmpty
          ? viewModel.error
          : 'Failed to create time slots';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ $errorMsg'), backgroundColor: Colors.red),
      );
    }
  }
}

// Helper class for slot input
class SlotInput {
  final String startTime;
  final String endTime;
  final int maxPatients;
  final String notes;

  SlotInput({
    required this.startTime,
    required this.endTime,
    required this.maxPatients,
    required this.notes,
  });

  SlotInput copyWith({
    String? startTime,
    String? endTime,
    int? maxPatients,
    String? notes,
  }) {
    return SlotInput(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      maxPatients: maxPatients ?? this.maxPatients,
      notes: notes ?? this.notes,
    );
  }
}

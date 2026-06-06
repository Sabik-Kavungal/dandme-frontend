import 'package:flutter/material.dart';
import 'package:drandme/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:drandme/modules/clinic/models/clinic_patient_model.dart';
import 'section_container.dart';
import 'section_header.dart';
import 'patient_search_card.dart';
import 'selected_patient_card.dart';
import 'country_code_dropdown.dart';
import 'unified_button.dart';

/// Patient search section with search input and results
class PatientSearchSection extends StatefulWidget {
  final NewAppointmentViewModel viewModel;
  final TextEditingController searchController;
  final double scaleFactor;
  final bool isMobile;
  final VoidCallback onAddNewPatient;
  final FocusNode searchFocusNode;

  const PatientSearchSection({
    super.key,
    required this.viewModel,
    required this.searchController,
    this.scaleFactor = 1.0,
    this.isMobile = false,
    required this.onAddNewPatient,
    required this.searchFocusNode,
  });

  @override
  State<PatientSearchSection> createState() => _PatientSearchSectionState();
}

class _PatientSearchSectionState extends State<PatientSearchSection> {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      scaleFactor: widget.scaleFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with modern label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionHeader(
                icon: Icons.person_search_rounded,
                title: 'Search Patient',
                scaleFactor: widget.scaleFactor,
                iconColor: const Color(0xFF334155),
              ),
              if (!widget.isMobile) _buildAddNewPatientButton(),
            ],
          ),
          SizedBox(height: 16 * widget.scaleFactor),

          // Search configuration area
          if (widget.isMobile)
            _buildMobileSearchLayout()
          else
            _buildWebSearchLayout(),

          // Search results with smooth transition
          if (widget.viewModel.clinicPatientSearchResults.isNotEmpty &&
              widget.viewModel.selectedClinicPatient == null) ...[
            SizedBox(height: 12 * widget.scaleFactor),
            _buildSearchResults(context),
          ],

          // Selected patient section
          if (widget.viewModel.selectedClinicPatient != null) ...[
            SizedBox(height: 16 * widget.scaleFactor),
            SelectedPatientCard(
              patient: widget.viewModel.selectedClinicPatient!,
              viewModel: widget.viewModel,
              scaleFactor: widget.scaleFactor,
              onDeselect: () => widget.viewModel.deselectClinicPatient(),
            ),
          ],

          if (widget.isMobile) ...[
            SizedBox(height: 16 * widget.scaleFactor),
            SizedBox(
              width: double.infinity,
              child: _buildAddNewPatientButton(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildWebSearchLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSearchTypeSelector(),
        SizedBox(width: 16 * widget.scaleFactor),
        Expanded(child: _buildSearchTextField()),
      ],
    );
  }

  Widget _buildMobileSearchLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchTypeSelector(),
        SizedBox(height: 12 * widget.scaleFactor),
        _buildSearchTextField(),
      ],
    );
  }

  Widget _buildSearchTypeSelector() {
    return Wrap(
      spacing: 12 * widget.scaleFactor,
      runSpacing: 10 * widget.scaleFactor,
      children: [
        _buildModernSelectionChip(
          'Mobile',
          Icons.phone_iphone_rounded,
          widget.viewModel.searchType == SearchType.mobile,
          () => widget.viewModel.setSearchTypeEnum(SearchType.mobile),
        ),
        _buildModernSelectionChip(
          'Mo ID',
          Icons.badge_outlined,
          widget.viewModel.searchType == SearchType.moId,
          () => widget.viewModel.setSearchTypeEnum(SearchType.moId),
        ),
        _buildModernSelectionChip(
          'Name',
          Icons.person_search_rounded,
          widget.viewModel.searchType == SearchType.name,
          () => widget.viewModel.setSearchTypeEnum(SearchType.name),
        ),
      ],
    );
  }

  Widget _buildModernSelectionChip(
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: 14 * widget.scaleFactor,
          vertical: 6 * widget.scaleFactor, // Reduced for compactness
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0F172A) : Colors.white,
          borderRadius: BorderRadius.circular(8), // Classy 8px radius
          border: Border.all(
            color: isSelected
                ? const Color(0xFF0F172A)
                : const Color(0xFFCBD5E1),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkbox-style box
            Container(
              width: 16 * widget.scaleFactor,
              height: 16 * widget.scaleFactor,
              margin: EdgeInsets.only(right: 8 * widget.scaleFactor),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? Colors.white : const Color(0xFFCBD5E1),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check_rounded,
                      size: 12,
                      color: Color(0xFF0F172A),
                    )
                  : null,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12 * widget.scaleFactor,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF475569),
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    final searchType = widget.viewModel.searchType;
    return Container(
      height: 42 * widget.scaleFactor, // Reduced from 52px
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Reduced rounding
        border: Border.all(color: const Color(0xFFCBD5E1), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            if (searchType == SearchType.mobile) ...[
              CountryCodeDropdown(
                selectedCountry: widget.viewModel.selectedCountryCode,
                onCountrySelected: (country) =>
                    widget.viewModel.setCountryCode(country),
                scaleFactor: widget.scaleFactor,
              ),
              Container(
                width: 1.2,
                height: 20 * widget.scaleFactor,
                color: const Color(0xFFCBD5E1),
              ),
            ] else
              Padding(
                padding: EdgeInsets.only(left: 12 * widget.scaleFactor),
                child: Icon(
                  searchType == SearchType.moId
                      ? Icons.badge_outlined
                      : Icons.person_search_rounded,
                  size: 18 * widget.scaleFactor,
                  color: const Color(0xFF64748B),
                ),
              ),
            Expanded(
              child: TextField(
                controller: widget.searchController,
                focusNode: widget.searchFocusNode,
                onChanged: (value) => widget.viewModel.setSearchQuery(value),
                style: TextStyle(
                  fontSize: 13 * widget.scaleFactor,
                  color: const Color(0xFF0F172A),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
                decoration: InputDecoration(
                  hintText: searchType == SearchType.mobile
                      ? 'Search mobile...'
                      : (searchType == SearchType.moId
                            ? 'Search MO ID...'
                            : 'Search name...'),
                  hintStyle: TextStyle(
                    color: const Color(0xFF94A3B8),
                    fontSize: 13 * widget.scaleFactor,
                    fontFamily: 'Inter',
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12 * widget.scaleFactor,
                  ),
                  isDense: true,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => widget.viewModel.searchClinicPatients(
                widget.searchController.text,
              ),
              child: Container(
                width: 34 * widget.scaleFactor,
                height: 34 * widget.scaleFactor,
                margin: EdgeInsets.only(right: 4 * widget.scaleFactor),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 18 * widget.scaleFactor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewPatientButton() {
    return UnifiedButton.addPatient(
      onPressed: widget.onAddNewPatient,
      scaleFactor: widget.scaleFactor,
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 280 * widget.scaleFactor),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8 * widget.scaleFactor),
        itemCount: widget.viewModel.clinicPatientSearchResults.length,
        itemBuilder: (context, index) {
          final patient = widget.viewModel.clinicPatientSearchResults[index];
          final isFollowUpType = widget.viewModel.selectedConsultationType
              .startsWith('follow-up');

          bool isEnabled = true;
          if (isFollowUpType && widget.viewModel.selectedDoctorObject != null) {
            final status = patient.getFollowUpStatus(
              doctorId: widget.viewModel.selectedDoctorObject!.doctorId!,
              departmentId: widget.viewModel.selectedDepartmentId,
            );
            isEnabled = status != 'no_appointment';
          }

          return PatientSearchCard(
            patient: patient,
            viewModel: widget.viewModel,
            scaleFactor: widget.scaleFactor,
            isEnabled: isEnabled,
            onTap: () {
              if (!isEnabled) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      '❌ Invalid for follow-up: No previous appointment found.',
                    ),
                    backgroundColor: const Color(0xFFEF4444),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
                return;
              }
              widget.viewModel.selectClinicPatient(patient);
            },
          );
        },
      ),
    );
  }
}

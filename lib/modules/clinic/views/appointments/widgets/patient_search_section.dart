import 'package:flutter/material.dart';
import 'package:a/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart';
import 'package:a/modules/clinic/models/clinic_patient_model.dart'; // For extension methods
import 'section_container.dart';
import 'section_header.dart';
import 'patient_search_card.dart';
import 'selected_patient_card.dart';
import 'country_code_dropdown.dart';
import 'unified_button.dart';

/// Patient search section with search input and results
class PatientSearchSection extends StatelessWidget {
  final NewAppointmentViewModel viewModel;
  final TextEditingController searchController;
  final double scaleFactor;
  final bool isMobile;
  final VoidCallback onAddNewPatient;

  const PatientSearchSection({
    super.key,
    required this.viewModel,
    required this.searchController,
    this.scaleFactor = 1.0,
    this.isMobile = false,
    required this.onAddNewPatient,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      scaleFactor: scaleFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          SectionHeader(
            icon: Icons.person_search,
            title: 'Search Patient',
            scaleFactor: scaleFactor,
            iconColor: const Color(0xFF6C757D),
          ),
          SizedBox(height: 8 * scaleFactor),

          // Search type radio buttons and input
          if (isMobile)
            _buildMobileSearchInput(context)
          else
            _buildWebSearchInput(context),

          // Search results
          if (viewModel.clinicPatientSearchResults.isNotEmpty) ...[
            SizedBox(height: 4 * scaleFactor),
            _buildSearchResults(context),
          ],

          // Selected patient card
          if (viewModel.selectedClinicPatient != null) ...[
            SizedBox(height: 8 * scaleFactor),
            SelectedPatientCard(
              patient: viewModel.selectedClinicPatient!,
              viewModel: viewModel,
              scaleFactor: scaleFactor,
              onDeselect: () => viewModel.deselectClinicPatient(),
            ),
          ],
        ],
      ),
    );
  }

  /// Build web search input (horizontal layout)
  Widget _buildWebSearchInput(BuildContext context) {
    return Row(
      children: [
        _buildSearchTypeRadioButtons(),
        SizedBox(width: 8 * scaleFactor),
        Expanded(child: _buildSearchTextField()),
        SizedBox(width: 8 * scaleFactor),
        _buildAddNewPatientButton(),
      ],
    );
  }

  /// Build mobile search input (vertical layout)
  Widget _buildMobileSearchInput(BuildContext context) {
    return Column(
      children: [
        Row(children: [_buildSearchTypeRadioButtons(), const Spacer()]),
        SizedBox(height: 12 * scaleFactor),
        Row(
          children: [
            Expanded(child: _buildSearchTextField()),
            SizedBox(width: 8 * scaleFactor),
            _buildAddNewPatientButton(),
          ],
        ),
      ],
    );
  }

  /// Build clean search type selection
  Widget _buildSearchTypeRadioButtons() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8 * scaleFactor,
        vertical: 6 * scaleFactor,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSimpleOption(
            'Mobile',
            Icons.phone_android,
            viewModel.searchType == SearchType.mobile,
            () => viewModel.setSearchTypeEnum(SearchType.mobile),
          ),
          SizedBox(width: 12 * scaleFactor),
          _buildSimpleOption(
            'Mo ID',
            Icons.badge,
            viewModel.searchType == SearchType.moId,
            () => viewModel.setSearchTypeEnum(SearchType.moId),
          ),
          SizedBox(width: 12 * scaleFactor),
          _buildSimpleOption(
            'Name',
            Icons.person,
            viewModel.searchType == SearchType.name,
            () => viewModel.setSearchTypeEnum(SearchType.name),
          ),
        ],
      ),
    );
  }

  /// Build simple option widget
  Widget _buildSimpleOption(
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: 8 * scaleFactor,
          vertical: 4 * scaleFactor,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E293B) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14 * scaleFactor,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
            SizedBox(width: 4 * scaleFactor),
            Text(
              label,
              style: TextStyle(
                fontSize: 12 * scaleFactor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build search text field based on search type
  Widget _buildSearchTextField() {
    // Handle searchType with proper fallback
    final searchType = viewModel.searchType;
    switch (searchType) {
      case SearchType.mobile:
        return _buildMobileSearchField();
      case SearchType.moId:
        return _buildWebSearchField();
      case SearchType.name:
        return _buildNameSearchField();
    }
  }

  /// Build mobile search field with country code dropdown
  Widget _buildMobileSearchField() {
    return Container(
      height: 36 * scaleFactor,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Country code dropdown
          CountryCodeDropdown(
            selectedCountry: viewModel.selectedCountryCode,
            onCountrySelected: (country) => viewModel.setCountryCode(country),
            scaleFactor: scaleFactor,
          ),
          // Divider
          Container(
            height: 20 * scaleFactor,
            width: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(horizontal: 6 * scaleFactor),
          ),
          // Phone number input
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: (value) => viewModel.setSearchQuery(value),
              decoration: InputDecoration(
                hintText: 'Enter mobile number',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13 * scaleFactor,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 6 * scaleFactor,
                  vertical: 8 * scaleFactor,
                ),
              ),
              style: TextStyle(fontSize: 13 * scaleFactor),
            ),
          ),
          // Search icon
          Container(
            margin: EdgeInsets.all(4 * scaleFactor),
            padding: EdgeInsets.all(6 * scaleFactor),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 14 * scaleFactor,
            ),
          ),
        ],
      ),
    );
  }

  /// Build web search field (Mo ID)
  Widget _buildWebSearchField() {
    return Container(
      height: 36 * scaleFactor,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        onChanged: (value) => viewModel.setSearchQuery(value),
        decoration: InputDecoration(
          hintText: 'Enter Mo ID',
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 13 * scaleFactor,
          ),
          prefixIcon: Icon(
            Icons.badge,
            color: const Color(0xFF1E293B),
            size: 16 * scaleFactor,
          ),
          suffixIcon: Container(
            margin: EdgeInsets.all(4 * scaleFactor),
            padding: EdgeInsets.all(6 * scaleFactor),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 14 * scaleFactor,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8 * scaleFactor,
            vertical: 8 * scaleFactor,
          ),
        ),
        style: TextStyle(fontSize: 13 * scaleFactor),
      ),
    );
  }

  /// Build name search field
  Widget _buildNameSearchField() {
    return Container(
      height: 36 * scaleFactor,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        onChanged: (value) => viewModel.setSearchQuery(value),
        decoration: InputDecoration(
          hintText: 'Enter patient name',
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 13 * scaleFactor,
          ),
          prefixIcon: Icon(
            Icons.person,
            color: const Color(0xFF1E293B),
            size: 16 * scaleFactor,
          ),
          suffixIcon: Container(
            margin: EdgeInsets.all(4 * scaleFactor),
            padding: EdgeInsets.all(6 * scaleFactor),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 14 * scaleFactor,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8 * scaleFactor,
            vertical: 8 * scaleFactor,
          ),
        ),
        style: TextStyle(fontSize: 13 * scaleFactor),
      ),
    );
  }

  /// Build simple add new patient button
  Widget _buildAddNewPatientButton() {
    return SizedBox(
      height: 32 * scaleFactor,
      child: UnifiedButton.addPatient(
        onPressed: onAddNewPatient,
        scaleFactor: scaleFactor,
      ),
    );
  }

  /// Build search results list
  Widget _buildSearchResults(BuildContext context) {
    return SizedBox(
      height: 200 * scaleFactor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.clinicPatientSearchResults.length,
        itemBuilder: (context, index) {
          final patient = viewModel.clinicPatientSearchResults[index];
          final isFollowUpType = viewModel.selectedConsultationType.startsWith(
            'follow-up',
          );

          // Check if patient can be selected
          bool isEnabled = true;
          if (isFollowUpType && viewModel.selectedDoctorObject != null) {
            final status = patient.getFollowUpStatus(
              doctorId: viewModel.selectedDoctorObject!.doctorId!,
              departmentId: viewModel.selectedDepartmentId,
            );
            isEnabled = status != 'no_appointment';
          }

          return PatientSearchCard(
            patient: patient,
            viewModel: viewModel,
            scaleFactor: scaleFactor,
            isEnabled: isEnabled,
            onTap: () {
              if (!isEnabled) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      '❌ Cannot book follow-up: Patient has no previous appointment with the selected doctor and department.\n\nPlease book a regular appointment first.',
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 4),
                  ),
                );
                return;
              }
              viewModel.selectClinicPatient(patient);
            },
          );
        },
      ),
    );
  }
}

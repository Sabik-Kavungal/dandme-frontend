# ✅ UI Integration - How to Connect New Methods

## 🎯 **Quick Integration Guide**

Here's how to add the new appointments and follow-ups display to your existing UI.

---

## 📝 **Step 1: Import the New Widget**

In your appointment booking screen, import the new widget:

```dart
import 'package:a/modules/clinic/views/appointments/widgets/patient_appointments_list.dart';
```

---

## 📝 **Step 2: Add to Your UI**

### **Option A: Show in Selected Patient Card**

Add to `selected_patient_card.dart`:

```dart
@override
Widget build(BuildContext context) {
  return Container(
    // ... existing code ...
    child: Column(
      children: [
        // Existing patient info
        ...existingWidgets,
        
        // ✅ ADD THIS: Show appointments and follow-ups
        if (viewModel.selectedClinicPatient != null)
          PatientAppointmentsList(
            patient: viewModel.selectedClinicPatient!,
            viewModel: viewModel,
          ),
      ],
    ),
  );
}
```

### **Option B: Show in Modal/Dialog When Patient is Selected**

```dart
void _showPatientDetails(BuildContext context) {
  if (viewModel.selectedClinicPatient == null) return;
  
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    '${viewModel.selectedClinicPatient!.firstName}\'s Details',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            
            // ✅ Appointments and Follow-ups List
            Expanded(
              child: PatientAppointmentsList(
                patient: viewModel.selectedClinicPatient!,
                viewModel: viewModel,
              ),
            ),
          ],
        );
      },
    ),
  );
}
```

### **Option C: Show in Separate Tab/Page**

Create a new page:

```dart
class PatientDetailsPage extends StatelessWidget {
  final ClinicPatient patient;
  final NewAppointmentViewModel viewModel;
  
  const PatientDetailsPage({
    super.key,
    required this.patient,
    required this.viewModel,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${patient.firstName} ${patient.lastName}'),
      ),
      body: PatientAppointmentsList(
        patient: patient,
        viewModel: viewModel,
      ),
    );
  }
}
```

Then navigate to it:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PatientDetailsPage(
      patient: viewModel.selectedClinicPatient!,
      viewModel: viewModel,
    ),
  ),
);
```

---

## 🎨 **Quick Example: Update Patient Search Card**

Add a button to view patient details:

```dart
// In patient_search_card.dart
ListTile(
  // ... existing patient info ...
  
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // ✅ ADD THIS: View Details Button
      IconButton(
        icon: const Icon(Icons.info_outline),
        tooltip: 'View Appointments & Follow-ups',
        onPressed: () {
          viewModel.selectClinicPatient(patient);
          _showPatientDetails(context);
        },
      ),
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: onTap,
      ),
    ],
  ),
)

// Add this method
void _showPatientDetails(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: Text('${patient.firstName}\'s Details'),
            ),
            Expanded(
              child: PatientAppointmentsList(
                patient: patient,
                viewModel: viewModel,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
```

---

## 🎯 **Complete Example: Full Integration**

```dart
class AppointmentBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewAppointmentViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            children: [
              // Search Section
              SearchPatientWidget(viewModel: viewModel),
              
              // Selected Patient Card
              if (viewModel.selectedClinicPatient != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Selected Patient Card
                      Expanded(
                        child: SelectedPatientCard(
                          patient: viewModel.selectedClinicPatient!,
                          viewModel: viewModel,
                          onDeselect: () => viewModel.deselectClinicPatient(),
                        ),
                      ),
                      
                      // ✅ ADD THIS: View Details Button
                      IconButton(
                        icon: const Icon(Icons.history),
                        tooltip: 'View Appointments & Follow-ups',
                        onPressed: () => _showPatientDetails(context, viewModel),
                      ),
                    ],
                  ),
                ),
              
              // ✅ ADD THIS: Quick Appointments Preview
              if (viewModel.selectedClinicPatient != null)
                Expanded(
                  child: PatientAppointmentsList(
                    patient: viewModel.selectedClinicPatient!,
                    viewModel: viewModel,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
  
  void _showPatientDetails(BuildContext context, NewAppointmentViewModel viewModel) {
    // ... show modal with details ...
  }
}
```

---

## ✅ **That's It!**

Now your UI will show:
- ✅ Patient's complete appointment history
- ✅ All follow-ups with status
- ✅ FREE vs PAID indicators
- ✅ Days remaining for active follow-ups
- ✅ Eligibility check button
- ✅ Book FREE or PAID follow-up buttons

**Ready to use!** 🚀


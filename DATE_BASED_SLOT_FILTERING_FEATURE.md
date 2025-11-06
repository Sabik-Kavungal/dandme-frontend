# Date-Based Slot Filtering Feature

## Overview
This document describes the implementation of the horizontal date selection feature with date-filtered time slot display in the New Appointment screen.

## Feature Summary
- **Horizontal Date Selector**: Displays available dates in a scrollable horizontal list
- **Date-Based Filtering**: Shows only slots available for the selected date
- **Default to Today**: Automatically selects today's date if available, otherwise the next available date
- **Card Layout**: Modern card-based display for time slots with detailed information
- **Real-time Updates**: Slots update automatically when date or consultation type changes

## Implementation Details

### 1. ViewModel Changes
**File:** `lib/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart`

#### Added State Variables
```dart
DateTime _selectedSlotDate = DateTime.now();
List<DateTime> _availableDates = [];
```

#### New Getters
- `selectedSlotDate` - Currently selected date for slot filtering
- `availableDates` - List of dates available for booking (next 14 days matching slot days)
- `doctorTimeSlots` - Now returns filtered slots for selected date
- `allDoctorTimeSlots` - Returns unfiltered slots

#### New Methods

**`_generateAvailableDates()`**
- Generates next 14 days that match doctor's available slot days
- Automatically selects today if available, otherwise first available date
- Called after loading doctor time slots

**`selectSlotDate(DateTime date)`**
- Sets the selected date for filtering
- Triggers UI update via `notifyListeners()`

**`getRemainingSlots(AvailableSlot slot)`**
- Returns remaining slot capacity
- Currently returns `maxPatients` as placeholder
- TODO: Integrate with appointment booking count API

### 2. Slot Filtering Logic

The filtering happens in the `doctorTimeSlots` getter:
```dart
List<AvailableSlot> get doctorTimeSlots {
  if (_doctorTimeSlots.isEmpty) return [];
  
  // Filter slots by selected date's day of week
  final selectedDayOfWeek = _selectedSlotDate.weekday;
  return _doctorTimeSlots
      .where((slot) => slot.dayOfWeek == selectedDayOfWeek)
      .toList();
}
```

**Key Points:**
- Filters by day of week (1=Monday, 7=Sunday)
- Automatically updates when date changes
- Returns empty list if no slots match

### 3. View Changes
**File:** `lib/modules/clinic/views/appointments/new_appointment_view.dart`

#### New Widgets

**`_buildHorizontalDateSelector()`**
Creates a horizontal scrollable date selector with:
- Date cards showing day name, date number, and month
- Visual indication of selected date (blue background)
- Small dot indicator for today's date
- Smooth scrolling experience
- Responsive sizing with `scaleFactor`

**Features:**
- Width: 65px per date card
- Height: 80px
- Selected state: Blue background with shadow
- Tap to select date

**`_buildTimeSlotCards()`**
Displays time slots in a modern card layout with:
- **Time Icon**: Green circular icon with clock symbol
- **Time Range**: Start and end time in 12-hour format (e.g., "9:00 AM - 5:00 PM")
- **Slot Type Badge**: 
  - Blue badge with video icon for online slots
  - Orange badge with person icon for in-person slots
- **Remaining Slots**: Shows available capacity with seat icon
- **Book Button**: Blue button to select the slot

**Card Layout:**
```
┌─────────────────────────────────────────────────────┐
│  [🕐]  9:00 AM - 5:00 PM  [📹 Online]   [Book]     │
│        💺 10 slots available                        │
└─────────────────────────────────────────────────────┘
```

#### Helper Methods

**`_getDayName(int weekday)`**
- Converts weekday number to short name (Mon, Tue, etc.)

**`_getMonthName(int month)`**
- Converts month number to short name (Jan, Feb, etc.)

**`_formatTime(String time24)`**
- Converts 24-hour time to 12-hour format with AM/PM
- Example: "09:00" → "9:00 AM", "17:00" → "5:00 PM"

### 4. User Flow

1. **Doctor Selection:**
   - User selects a doctor from dropdown
   - System loads time slots for that doctor
   - Available dates are generated based on slot days
   - Today's date is selected by default (if available)
   - Slots for today are displayed

2. **Date Selection:**
   - User sees horizontal date selector with available dates
   - User taps a different date
   - Slots automatically filter to show only that day's slots
   - Empty message shown if no slots for that date

3. **Consultation Type Change:**
   - User switches between Online/In-Person
   - Slots reload and filter by type
   - Date selector updates to show only dates with that type
   - Selected date persists if it has slots of new type

4. **Slot Booking:**
   - User taps "Book" button on desired slot card
   - Slot time is saved to viewModel
   - User can proceed with appointment creation

## UI/UX Features

### Date Selector Design
- **Clean Cards**: White cards with rounded corners
- **Selected State**: Bold blue background with subtle shadow
- **Today Indicator**: Small blue dot below month name
- **Smooth Scrolling**: Horizontal scroll for easy navigation
- **Responsive**: Scales appropriately for different screen sizes

### Slot Card Design
- **Professional Look**: White cards with subtle shadows
- **Color-Coded Types**: 
  - Online: Blue accents
  - In-Person: Orange accents
- **Clear Information Hierarchy**:
  1. Time (largest, bold)
  2. Type badge (colored)
  3. Remaining slots (smaller, gray)
- **Action Button**: Prominent blue "Book" button

### Empty States
- **No Doctor Selected**: "No time slots available. Please select a doctor."
- **No Slots for Date**: "No time slots available for this date."
- Clear messaging helps users understand next steps

## Technical Considerations

### Date Generation Strategy
- Generates 14 days ahead
- Only includes dates matching doctor's available days
- Prevents showing dates with no slots
- Efficient filtering reduces API calls

### Performance
- Filtering done in memory (no API calls)
- Date list generated once per doctor selection
- UI updates use efficient `notifyListeners()`
- Card rendering optimized with ListView

### Slot Capacity (Future Enhancement)
Current implementation uses `maxPatients` as remaining slots.

**Future Integration:**
```dart
// TODO: Fetch booked appointment count for slot
int getRemainingSlots(AvailableSlot slot) {
  // Fetch count of appointments for this slot
  final bookedCount = await getBookedAppointmentsCount(slot.id);
  return slot.maxPatients - bookedCount;
}
```

**Required API:**
```
GET /api/organizations/appointments/count?slot_id={slotId}&date={date}
Response: { "booked_count": 5 }
```

## Testing Checklist

- [ ] Date selector displays correctly on mobile and web
- [ ] Today's date is highlighted
- [ ] Selected date shows blue background
- [ ] Tapping date filters slots correctly
- [ ] Slots display in card format with all information
- [ ] Time format converts correctly (24h → 12h)
- [ ] Online/offline type badges show correct colors and icons
- [ ] Remaining slots count displays
- [ ] Book button updates selected time slot
- [ ] Empty states show appropriate messages
- [ ] Changing consultation type updates available dates
- [ ] Changing doctor regenerates date list
- [ ] Scrolling works smoothly
- [ ] Layout is responsive across screen sizes

## Known Limitations

1. **Static Capacity**: Remaining slots currently shows max capacity, not real-time availability
2. **14-Day Window**: Only shows next 14 days (configurable)
3. **Day-Based Only**: Filters by day of week, not specific dates
4. **No Time Zone**: Uses device local time
5. **No Booking Lock**: Multiple users can book same slot simultaneously

## Future Enhancements

1. **Real-Time Availability**: Integrate with booking count API
2. **Time Slot Booking Lock**: Prevent double-booking
3. **Extended Date Range**: Option to view more days ahead
4. **Date-Specific Slots**: Support for specific date overrides
5. **Slot Popularity Indicator**: Show which slots are filling up
6. **Time Zone Support**: Handle different time zones
7. **Recurring Slot Patterns**: Visual indication of regular schedules
8. **Slot Filtering Options**: Filter by time of day, duration, etc.
9. **Calendar View Option**: Alternative calendar picker view
10. **Favorites**: Save preferred time slots

## Related Files

- **ViewModel:** `lib/modules/clinic/viewmodels/appointments/new_appointment_viewmodel.dart`
- **View:** `lib/modules/clinic/views/appointments/new_appointment_view.dart`
- **Models:** `lib/modules/clinic/models/doctor_time_slot_model.dart`
- **Repository:** `lib/modules/clinic/repositories/doctor_time_slot_repository.dart`

## Design Specifications

### Colors
- **Primary Blue:** `#007BFF`
- **Online Type:** `#1976D2` (blue)
- **In-Person Type:** `#F57C00` (orange)
- **Success Green:** `#28A745`
- **Text Primary:** `#333333`
- **Text Secondary:** `#666666`
- **Border:** `#E0E0E0`
- **Background:** `#F8F8F8`

### Spacing
- Date card width: 65px
- Date card height: 80px
- Card margin: 12px
- Card padding: 16px
- Icon size: 24px
- Border radius: 12px (cards), 8px (buttons)

### Typography
- Date day name: 12px, medium weight
- Date number: 20px, bold
- Month name: 11px, regular
- Time range: 16px, bold
- Type badge: 11px, semi-bold
- Remaining slots: 13px, regular
- Button: 14px, semi-bold


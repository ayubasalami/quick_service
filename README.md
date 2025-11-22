# Service Provider Booking App

A Flutter application for browsing and booking service providers with an intuitive interface for managing appointments.

## Time Spent

Approximately **1 hour 40 minutes**

## State Management Approach

I chose **Riverpod** as the state management solution for this project. Riverpod provides a robust, compile-safe approach to state management with excellent testability and no context dependency. I implemented a `BookingViewModel` using `StateNotifier` to manage the booking flow, handling date selection, time slot selection, duration changes, and price calculations in a clean, organized manner.

## Setup Instructions

1. Clone the repository
   ```bash
   git clone <your-repository-url>
   cd <project-folder>
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Run the application
   ```bash
   flutter run
   ```

## Flutter Version

- **Flutter**: 3.32.7
- **Dart**: 3.x.x

*(Run `flutter --version` to get your Dart version)*

## Project Structure

```
lib/
├── main.dart
├── models/
│   └── provider_model.dart
├── screens/
│   ├── provider_list_screen.dart
│   └── booking_screen.dart
├── widgets/
│   
├── view_models/
│   └── booking_view_model.dart
├── core/
│   └── booking_state.dart
├── riverpod_providers/
│   └── providers.dart
└── theme/
    └── app_theme.dart
```

## Features Implemented

### Provider List Screen
- ✅ Scrollable list of 10 service providers
- ✅ Provider cards with profile images, ratings, hourly rates
- ✅ Verification badges for verified providers
- ✅ Search functionality (case-insensitive name filtering)
- ✅ Loading state with 1-second simulated delay
- ✅ "No providers found" message for empty search results
- ✅ Clear search button

### Booking Screen
- ✅ Provider summary section with avatar and details
- ✅ Date selector showing next 7 days
- ✅ Time slot selector (6 slots, some marked as booked)
- ✅ Duration selector dropdown (1-3 hours)
- ✅ Dynamic price calculation
- ✅ Confirm button with proper enable/disable logic
- ✅ Success dialog with booking summary
- ✅ Loading indicator during booking confirmation




### Challenges Encountered
- Balancing feature completeness with code quality within the 2-hour constraint
- Ensuring proper widget extraction without over-engineering
- Managing state updates efficiently for real-time price calculations

### Trade-offs
- Used simple mock data instead of more complex data structures
- Focused on functionality over advanced animations
- Simplified the booking confirmation flow (no payment processing)
- Used static time slots instead of dynamic availability

## If I Had More Time

1. **Enhanced UI/UX**
    - Add smooth page transitions and micro-animations
    - Implement shimmer loading effect for provider cards
    - Add pull-to-refresh functionality on provider list
    - Create custom date picker with calendar view option

2. **Additional Features**
    - Implement provider categories filter
    - Add favorites/bookmarks functionality
    - Show booking history screen
    - Add provider details screen with reviews and gallery
    - Implement price range filter
    - Add sorting options (by rating, price, availability)

3. **Code Improvements**
    - Add comprehensive unit tests for view models
    - Add widget tests for critical user flows
    - Implement proper error handling with custom error states
    - Add accessibility features (screen reader support, semantic labels)
    - Optimize performance with const constructors where possible

4. **Advanced Features**
    - Real-time availability checking
    - Multiple service bookings in one session
    - Cancellation and rescheduling functionality
    - Push notifications for booking reminders
    - Integration with calendar apps

## Dependencies Used

```yaml
dependencies:
  flutter_riverpod: ^3.0.3
  shimmer: ^3.0.0
  intl: ^0.20.2
```

eted as part of a technical assessment with a strict 2-hour time limit. The focus was on demonstrating clean code, proper state management, and functional UI implementation rather than feature completeness.
import 'package:flutter_riverpod/legacy.dart';

import '../core/booking_state.dart';

class BookingViewModel extends StateNotifier<BookingState> {
  BookingViewModel()
    : super(const BookingState(bookedSlots: ['11:00 AM', '3:00 PM']));

  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void selectTimeSlot(String timeSlot) {
    if (!state.bookedSlots.contains(timeSlot)) {
      state = state.copyWith(selectedTimeSlot: timeSlot);
    }
  }

  void selectDuration(int duration) {
    if (duration >= 1 && duration <= 3) {
      state = state.copyWith(selectedDuration: duration);
    }
  }

  bool isSlotBooked(String timeSlot) {
    return state.bookedSlots.contains(timeSlot);
  }

  bool isSlotAvailable(String timeSlot) {
    return !state.bookedSlots.contains(timeSlot);
  }

  bool isSlotSelected(String timeSlot) {
    return state.selectedTimeSlot == timeSlot;
  }

  bool isDateSelected(DateTime date) {
    if (state.selectedDate == null) return false;
    return state.selectedDate!.year == date.year &&
        state.selectedDate!.month == date.month &&
        state.selectedDate!.day == date.day;
  }

  void clearTimeSlot() {
    state = state.copyWith(selectedTimeSlot: null);
  }

  void clearDate() {
    state = state.copyWith(selectedDate: null);
  }

  void reset() {
    state = BookingState(bookedSlots: state.bookedSlots);
  }

  Future<bool> confirmBooking() async {
    if (!state.canConfirmBooking) return false;

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      return true;
    } catch (e) {
      return false;
    }
  }

  String? getFormattedDate() {
    if (state.selectedDate == null) return null;
    return '${state.selectedDate!.day}/${state.selectedDate!.month}/${state.selectedDate!.year}';
  }

  Map<String, dynamic> getBookingSummary(
    String providerName,
    double hourlyRate,
  ) {
    return {
      'provider': providerName,
      'date': state.selectedDate,
      'time': state.selectedTimeSlot,
      'duration': state.selectedDuration,
      'total': state.calculateTotal(hourlyRate),
    };
  }

  @override
  void dispose() {
    super.dispose();
  }
}

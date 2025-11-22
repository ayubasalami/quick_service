class BookingState {
  final DateTime? selectedDate;
  final String? selectedTimeSlot;
  final int selectedDuration;
  final List<String> bookedSlots;

  const BookingState({
    this.selectedDate,
    this.selectedTimeSlot,
    this.selectedDuration = 1,
    required this.bookedSlots,
  });

  BookingState copyWith({
    DateTime? selectedDate,
    String? selectedTimeSlot,
    int? selectedDuration,
    List<String>? bookedSlots,
  }) {
    return BookingState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
      selectedDuration: selectedDuration ?? this.selectedDuration,
      bookedSlots: bookedSlots ?? this.bookedSlots,
    );
  }

  bool get canConfirmBooking =>
      selectedDate != null && selectedTimeSlot != null;

  double calculateTotal(double hourlyRate) {
    return hourlyRate * selectedDuration;
  }

  bool get hasDateSelected => selectedDate != null;

  bool get hasTimeSelected => selectedTimeSlot != null;

  bool get isComplete => hasDateSelected && hasTimeSelected;

  int get completionPercentage {
    int completed = 0;
    if (hasDateSelected) completed += 50;
    if (hasTimeSelected) completed += 50;
    return completed;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../core/booking_state.dart';
import '../core/provider_list_state.dart';
import '../models/provider_model.dart';
import '../view_models/booking _view_model.dart';
import '../view_models/provider_list_view_model.dart';

final providerListViewModelProvider =
    StateNotifierProvider<ProviderListViewModel, ProviderListState>(
      (ref) => ProviderListViewModel(),
    );

final allProvidersProvider = Provider<List<ServiceProvider>>((ref) {
  return mockProviders;
});

final filteredProvidersProvider = Provider<List<ServiceProvider>>((ref) {
  final state = ref.watch(providerListViewModelProvider);
  return state.filteredProviders;
});

final searchQueryProvider = Provider<String>((ref) {
  final state = ref.watch(providerListViewModelProvider);
  return state.searchQuery;
});

final isLoadingProvidersProvider = Provider<bool>((ref) {
  final state = ref.watch(providerListViewModelProvider);
  return state.isLoading;
});

final bookingViewModelProvider =
    StateNotifierProvider<BookingViewModel, BookingState>(
      (ref) => BookingViewModel(),
    );

final selectedDateProvider = Provider<DateTime?>((ref) {
  final state = ref.watch(bookingViewModelProvider);
  return state.selectedDate;
});

final selectedTimeSlotProvider = Provider<String?>((ref) {
  final state = ref.watch(bookingViewModelProvider);
  return state.selectedTimeSlot;
});

final selectedDurationProvider = Provider<int>((ref) {
  final state = ref.watch(bookingViewModelProvider);
  return state.selectedDuration;
});

final canConfirmBookingProvider = Provider<bool>((ref) {
  final state = ref.watch(bookingViewModelProvider);
  return state.canConfirmBooking;
});

final totalPriceProvider = Provider.family<double, double>((ref, hourlyRate) {
  final state = ref.watch(bookingViewModelProvider);
  return state.calculateTotal(hourlyRate);
});

final bookedSlotsProvider = Provider<List<String>>((ref) {
  final state = ref.watch(bookingViewModelProvider);
  return state.bookedSlots;
});

final next7DaysProvider = Provider<List<DateTime>>((ref) {
  final today = DateTime.now();
  return List.generate(7, (index) => today.add(Duration(days: index)));
});

final availableTimeSlotsProvider = Provider<List<String>>((ref) {
  return ['9:00 AM', '11:00 AM', '1:00 PM', '3:00 PM', '5:00 PM', '7:00 PM'];
});

final durationOptionsProvider = Provider<List<int>>((ref) {
  return [1, 2, 3];
});

final verifiedProvidersCountProvider = Provider<int>((ref) {
  final providers = ref.watch(allProvidersProvider);
  return providers.where((p) => p.isVerified).length;
});

final averageRatingProvider = Provider<double>((ref) {
  final providers = ref.watch(allProvidersProvider);
  if (providers.isEmpty) return 0.0;
  final totalRating = providers.fold<double>(
    0.0,
    (sum, provider) => sum + provider.rating,
  );
  return totalRating / providers.length;
});

final isTimeSlotBookedProvider = Provider.family<bool, String>((ref, timeSlot) {
  final bookedSlots = ref.watch(bookedSlotsProvider);
  return bookedSlots.contains(timeSlot);
});

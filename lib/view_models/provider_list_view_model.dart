import 'package:flutter_riverpod/legacy.dart';

import '../core/provider_list_state.dart';
import '../models/provider_model.dart';

class ProviderListViewModel extends StateNotifier<ProviderListState> {
  ProviderListViewModel()
    : super(
        const ProviderListState(
          providers: [],
          isLoading: true,
          searchQuery: '',
        ),
      ) {
    loadProviders();
  }

  Future<void> loadProviders() async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(providers: mockProviders, isLoading: false);
    } catch (e) {
      state = state.copyWith(providers: [], isLoading: false);
    }
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void clearSearch() {
    state = state.copyWith(searchQuery: '');
  }

  Future<void> refresh() async {
    await loadProviders();
  }

  void filterByVerification(bool verifiedOnly) {
    if (verifiedOnly) {
      final verifiedProviders = mockProviders
          .where((p) => p.isVerified)
          .toList();
      state = state.copyWith(providers: verifiedProviders);
    } else {
      state = state.copyWith(providers: mockProviders);
    }
  }

  void sortByRating() {
    final sorted = [...state.providers]
      ..sort((a, b) => b.rating.compareTo(a.rating));
    state = state.copyWith(providers: sorted);
  }

  void sortByPrice() {
    final sorted = [...state.providers]
      ..sort((a, b) => a.hourlyRate.compareTo(b.hourlyRate));
    state = state.copyWith(providers: sorted);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

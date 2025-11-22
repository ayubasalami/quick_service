import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../core/provider_list_state.dart';
import '../models/provider_model.dart';
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

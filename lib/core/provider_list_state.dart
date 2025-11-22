import '../models/provider_model.dart';

class ProviderListState {
  final List<ServiceProvider> providers;
  final bool isLoading;
  final String searchQuery;

  const ProviderListState({
    required this.providers,
    required this.isLoading,
    required this.searchQuery,
  });

  ProviderListState copyWith({
    List<ServiceProvider>? providers,
    bool? isLoading,
    String? searchQuery,
  }) {
    return ProviderListState(
      providers: providers ?? this.providers,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<ServiceProvider> get filteredProviders {
    if (searchQuery.isEmpty) return providers;
    return providers.where((provider) {
      return provider.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  int get filteredCount => filteredProviders.length;

  bool get hasProviders => filteredProviders.isNotEmpty;

  bool get isSearching => searchQuery.isNotEmpty;
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod_providers/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/provider_list_empty_state.dart';
import '../widgets/provider_list_header.dart';
import '../widgets/provider_list_view.dart';

class ProviderListScreen extends ConsumerWidget {
  const ProviderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(providerListViewModelProvider);
    final viewModel = ref.read(providerListViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ProviderListHeader(state: state, viewModel: viewModel),

          Expanded(
            child: state.isLoading
                ? const LoadingShimmer()
                : state.filteredProviders.isEmpty
                ? const ProviderListEmptyState()
                : ProviderListView(state: state),
          ),
        ],
      ),
    );
  }
}

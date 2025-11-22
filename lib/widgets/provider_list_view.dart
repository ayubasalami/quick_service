import 'package:flutter/material.dart';
import 'package:quickservice/widgets/provider_card.dart';

import '../core/provider_list_state.dart';
import '../theme/app_theme.dart';

class ProviderListView extends StatelessWidget {
  final ProviderListState state;

  const ProviderListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: state.filteredProviders.length,
      itemBuilder: (context, index) {
        return ProviderCard(provider: state.filteredProviders[index]);
      },
    );
  }
}

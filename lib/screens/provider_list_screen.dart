import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod_providers/providers.dart';

class ProviderListScreen extends ConsumerWidget {
  const ProviderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(providerListViewModelProvider);
    final viewModel = ref.read(providerListViewModelProvider.notifier);

    return Scaffold(body: Column(children: []));
  }
}

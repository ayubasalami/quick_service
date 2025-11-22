import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/provider_model.dart';
import '../riverpod_providers/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/confirm_booking_button.dart';
import '../widgets/confirmation_row.dart';
import '../widgets/date_selector.dart';
import '../widgets/duraton_selector.dart';
import '../widgets/price_summary_card.dart';
import '../widgets/provider_summary.dart';
import '../widgets/time_slot_selector.dart';

class BookingScreen extends ConsumerStatefulWidget {
  final ServiceProvider provider;

  const BookingScreen({super.key, required this.provider});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final List<String> timeSlots = [
    '9:00 AM',
    '11:00 AM',
    '1:00 PM',
    '3:00 PM',
    '5:00 PM',
    '7:00 PM',
  ];

  final List<int> durations = [1, 2, 3];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingViewModelProvider.notifier).selectDate(DateTime.now());
    });
  }

  Future<void> _confirmBooking() async {
    final state = ref.read(bookingViewModelProvider);

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;
    Navigator.pop(context);

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 32,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            const Expanded(
              child: Text(
                'Booking Confirmed!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConfirmationRow(label: 'Provider', value: widget.provider.name),
            ConfirmationRow(
              label: 'Date',
              value: DateFormat(
                'EEEE, MMM d, yyyy',
              ).format(state.selectedDate!),
            ),
            ConfirmationRow(label: 'Time', value: state.selectedTimeSlot!),
            ConfirmationRow(
              label: 'Duration',
              value:
                  '${state.selectedDuration} hour${state.selectedDuration > 1 ? 's' : ''}',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
              child: Divider(height: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '\$${state.calculateTotal(widget.provider.hourlyRate).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              ),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingViewModelProvider);
    final viewModel = ref.read(bookingViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Book Service'), elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProviderSummaryCard(provider: widget.provider),
                  const SizedBox(height: AppSpacing.md),
                  DateSelector(state: state, viewModel: viewModel),
                  const SizedBox(height: AppSpacing.lg),
                  TimeSlotSelector(
                    state: state,
                    viewModel: viewModel,
                    timeSlots: timeSlots,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  DurationSelector(
                    state: state,
                    viewModel: viewModel,
                    durations: durations,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  PriceSummaryCard(
                    state: state,
                    hourlyRate: widget.provider.hourlyRate,
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
          ConfirmBookingButton(state: state, onPressed: _confirmBooking),
        ],
      ),
    );
  }
}

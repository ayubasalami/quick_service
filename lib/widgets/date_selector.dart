import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/booking_state.dart';
import '../theme/app_theme.dart';
import '../view_models/booking _view_model.dart';
import 'date_card.dart';

class DateSelector extends StatelessWidget {
  final BookingState state;
  final BookingViewModel viewModel;

  const DateSelector({super.key, required this.state, required this.viewModel});

  List<DateTime> _getNext7Days() {
    final today = DateTime.now();
    return List.generate(7, (index) => today.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Date',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final date = _getNext7Days()[index];
                final isSelected =
                    state.selectedDate != null &&
                    DateFormat('yyyy-MM-dd').format(date) ==
                        DateFormat('yyyy-MM-dd').format(state.selectedDate!);
                final isToday = index == 0;

                return DateCard(
                  date: date,
                  isSelected: isSelected,
                  isToday: isToday,
                  onTap: () => viewModel.selectDate(date),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

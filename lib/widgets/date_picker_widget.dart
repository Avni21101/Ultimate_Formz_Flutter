import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/widgets/date_time_container.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedValue = await showDatePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.blueAccent.withOpacity(0.6),
          ),
        ),
        child: child!,
      ),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      fieldHintText: 'Select movie date',
    );
    if (mounted) {
      if (pickedValue != null &&
          pickedValue != context.read<ValidationCubit>().state.dateValue.value) {
        context.read<ValidationCubit>().onDateChange(pickedValue);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateTimeContainer(
              onTap: () => _selectDate(context),
              label: state.dateValue.value == null
                  ? 'Select Date'
                  : '${state.dateValue.value!.day}-${state.dateValue.value!.month}-${state.dateValue.value!.year}',
            ),
            const SizedBox(height: 8),
            if (state.dateValue.displayError != null)
              const Text(
                'Please select a date',
                style: TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}

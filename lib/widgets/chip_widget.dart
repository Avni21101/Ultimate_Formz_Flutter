import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/widgets/snackbar_widget.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({super.key});

  static final _list = ['Dragon', 'Unicorn', 'Phoenix'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidationCubit, ValidationState>(
      listenWhen: (previous, current) => previous.chipValue != current.chipValue,
      listener: (context, state) {
        if (state.chipValue.displayError != null) {
          showAppSnackBar(context, 'Please pick a fantasy creature.');
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pick a Fantasy Creature',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 5.0,
              children: List.generate(
                _list.length,
                (int index) {
                  return ChoiceChip(
                    selectedColor: Colors.blueAccent.withOpacity(0.3),
                    label: Text(_list[index]),
                    selected: state.chipValue.value == index,
                    onSelected: (_) {
                      context.read<ValidationCubit>().onChipValueChange(index);
                    },
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}

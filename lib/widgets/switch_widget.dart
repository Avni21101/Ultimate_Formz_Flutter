import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/widgets/snackbar_widget.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidationCubit, ValidationState>(
      listenWhen: (previous, current) => previous.switchValue != current.switchValue,
      listener: (context, state) {
        if (state.switchValue.displayError != null) {
          showAppSnackBar(context, "Please select either 'Yes' or 'No' to proceed.");
        }
      },
      builder: (context, state) {
        return SwitchListTile(
          value: state.switchValue.value ?? false,
          title: const Text(
            'Would you like to receive email reports?',
            maxLines: 2,
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          onChanged: (bool value) {
            context.read<ValidationCubit>().onSwitchChange(value);
          },
          inactiveThumbColor: state.switchValue.value == null ? Colors.grey : Colors.blueAccent,
          activeColor: Colors.blueAccent,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';
import 'package:input_field_validation_formz_flutter/widgets/snackbar_widget.dart';

enum SuperPower { invisibility, timeTravel, teleportation }

class RadioWidget extends StatelessWidget {
  const RadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidationCubit, ValidationState>(
      listenWhen: (previous, current) => previous.radioValue != current.radioValue,
      listener: (context, state) {
        if (state.radioValue.displayError != null) {
          showAppSnackBar(context, 'Please select your super power.');
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.2),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  'Choose Your Super Power',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              ListTile(
                title: const Text('Invisibility'),
                leading: Radio<SuperPower>(
                  activeColor: Colors.blueAccent,
                  value: SuperPower.invisibility,
                  groupValue: state.radioValue.value,
                  onChanged: (SuperPower? value) {
                    context.read<ValidationCubit>().onRadioChange(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('Time Travel'),
                leading: Radio<SuperPower>(
                  activeColor: Colors.blueAccent,
                  value: SuperPower.timeTravel,
                  groupValue: state.radioValue.value,
                  onChanged: (SuperPower? value) {
                    context.read<ValidationCubit>().onRadioChange(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('Teleportation'),
                leading: Radio<SuperPower>(
                  activeColor: Colors.blueAccent,
                  value: SuperPower.teleportation,
                  groupValue: state.radioValue.value,
                  onChanged: (SuperPower? value) {
                    context.read<ValidationCubit>().onRadioChange(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

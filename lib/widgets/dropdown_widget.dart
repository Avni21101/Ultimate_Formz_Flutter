import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_field_validation_formz_flutter/cubit/validation_cubit.dart';

const List<DropdownModel> list = [
  DropdownModel(label: 'day', id: 1),
  DropdownModel(label: 'week', id: 2),
  DropdownModel(label: 'month', id: 3),
  DropdownModel(label: 'year', id: 4),
];

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      builder: (context, state) {
        return DropdownButtonFormField<DropdownModel>(
          value: list.contains(state.dropdownValue.value) ? state.dropdownValue.value : null,
          icon: const Icon(Icons.arrow_drop_down_outlined),
          elevation: 16,
          hint: const Text('Select the filter'),
          style: const TextStyle(color: Colors.deepPurple),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorText:
                state.dropdownValue.displayError != null ? 'Please select one filter.' : null,
          ),
          isExpanded: true,
          borderRadius: BorderRadius.circular(20),
          onChanged: (value) {
            context.read<ValidationCubit>().onDropdownChange(value);
          },
          items: list.map<DropdownMenuItem<DropdownModel>>(
            (item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item.label,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class DropdownModel implements Equatable {
  const DropdownModel({
    required this.label,
    this.id,
  });

  final String label;
  final int? id;

  @override
  List<Object?> get props => [label, id];

  @override
  bool? get stringify => true;
}

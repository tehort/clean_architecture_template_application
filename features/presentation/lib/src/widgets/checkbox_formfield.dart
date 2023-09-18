import 'package:flutter/material.dart';

class CheckBoxFormField extends FormField<bool> {
  CheckBoxFormField({
    required this.isChecked,
    required this.label,
    required this.onChanged,
    super.key,
    super.validator,
  }) : super(
          initialValue: isChecked,
          builder: (field) {
            void onChangedHandler(bool? value) {
              field.didChange(value);
              onChanged(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: onChangedHandler,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    label,
                  ],
                ),
                if (field.isValid)
                  Container()
                else
                  Text(
                    field.errorText ?? '',
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 13,
                    ),
                  ),
              ],
            );
          },
        );

  final bool isChecked;
  final Widget label;
  final void Function(bool?) onChanged;

  @override
  _CheckBoxFormFieldState createState() => _CheckBoxFormFieldState();
}

class _CheckBoxFormFieldState extends FormFieldState<bool> {
  @override
  CheckBoxFormField get widget => super.widget as CheckBoxFormField;

  @override
  void didChange(bool? value) {
    super.didChange(value);
  }
}

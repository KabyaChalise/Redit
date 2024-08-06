import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextFieldWithLabel extends ConsumerWidget {
  const CustomReactiveTextFieldWithLabel({
    super.key,
    required this.label,
    required this.formControlName,
    this.keyboardType,
    required this.outLabel,
    this.onSubmitted,
    this.onChanged,
    this.isObscureText = false,
  });

  final void Function(FormControl<dynamic>)? onChanged;

  final TextInputType? keyboardType;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final String label;
  final String formControlName;
  final String outLabel;
  final bool isObscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          outLabel,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: height * 0.008,
        ),
        ReactiveTextField(
          obscureText: isObscureText ? true : false,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          formControlName: formControlName,
          decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700,
              ),
            ),
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo.shade200,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo.shade200,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo.shade200,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.indigo[30],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}

class CustomReactiveTextField extends ConsumerWidget {
  const CustomReactiveTextField({
    super.key,
    required this.label,
    required this.formControlName,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.floatingLabelBehavior,
    this.readOnly,
  });

  final void Function(FormControl<dynamic>)? onChanged;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final String label;
  final String formControlName;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveTextField(
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      formControlName: formControlName,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        isDense: true,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.always,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}

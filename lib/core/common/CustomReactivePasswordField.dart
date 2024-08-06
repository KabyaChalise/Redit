import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

// CustomReactivePasswordFieldWithLabel class
class CustomReactivePasswordFieldWithLabel extends ConsumerStatefulWidget {
  const CustomReactivePasswordFieldWithLabel({
    super.key,
    required this.label,
    required this.formControlName,
    this.keyboardType,
    required this.outLabel,
    this.onSubmitted,
    this.onChanged,
  });

  final void Function(FormControl<dynamic>)? onChanged;
  final TextInputType? keyboardType;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final String label;
  final String formControlName;
  final String outLabel;

  @override
  _CustomReactivePasswordFieldWithLabelState createState() =>
      _CustomReactivePasswordFieldWithLabelState();
}

// State class for CustomReactivePasswordFieldWithLabel
class _CustomReactivePasswordFieldWithLabelState
    extends ConsumerState<CustomReactivePasswordFieldWithLabel> {
  bool obscureText = true; // Initial state for password visibility
  Icon visibleIcon = Icon(Icons.visibility_off); // Initial icon for lock

  void _onlockPressed() {
    setState(() {
      obscureText = !obscureText; // Toggle password visibility
      visibleIcon = obscureText
          ? Icon(Icons.visibility_off)
          : Icon(Icons.visibility); // Toggle lock icon
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.outLabel,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: height * 0.008,
        ),
        ReactiveTextField(
          obscureText: obscureText, // Use the obscureText state
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          formControlName: widget.formControlName,
          decoration: InputDecoration(
            label: Text(
              widget.label,
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
            suffixIcon: IconButton(
              onPressed: _onlockPressed, // Toggle password visibility on press
              icon: visibleIcon, // Display the current lock icon
            ),
          ),
        ),
      ],
    );
  }
}

// CustomReactivePasswordField class
class CustomReactivePasswordField extends ConsumerStatefulWidget {
  const CustomReactivePasswordField({
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
  _CustomReactivePasswordFieldState createState() =>
      _CustomReactivePasswordFieldState();
}

// State class for CustomReactivePasswordField
class _CustomReactivePasswordFieldState
    extends ConsumerState<CustomReactivePasswordField> {
  bool obscureText = true; // Initial state for password visibility
  Icon lockIcon = Icon(Icons.lock); // Initial icon for lock

  void _onlockPressed() {
    setState(() {
      obscureText = !obscureText; // Toggle password visibility
      lockIcon = obscureText
          ? Icon(Icons.lock)
          : Icon(Icons.lock_open); // Toggle lock icon
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      obscureText: obscureText, // Use the obscureText state
      readOnly: widget.readOnly ?? false,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      formControlName: widget.formControlName,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        isDense: true,
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.always,
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
        suffixIcon: IconButton(
          onPressed: _onlockPressed, // Toggle password visibility on press
          icon: lockIcon, // Display the current lock icon
        ),
      ),
    );
  }
}

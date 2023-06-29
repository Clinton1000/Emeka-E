import 'package:changecollect/view/screen/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class PrimaryInputField extends StatefulWidget {
  final IconData prefixIcon;
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged; // Add this line

  PrimaryInputField({
    this.prefixIcon,
    this.label,
    this.controller,
    this.validator,
    this.onChanged, // Add this line
  });

  @override
  _PrimaryInputFieldState createState() => _PrimaryInputFieldState();
}

class _PrimaryInputFieldState extends State<PrimaryInputField> {
  // Remove the _textController

  bool _showClearIcon = false;
  bool _isValid = true;
  bool _isFocused = false;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  void _validateInput() {
    final isValid = widget.validator?.call(widget.controller.text) == null;
    setState(() {
      _isValid = isValid;
      _showClearIcon = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            widget.prefixIcon,
          ),
        ),
        suffixIcon: _showClearIcon
            ? GestureDetector(
          onTap: () {
            widget.controller.clear();
            setState(() {
              _showClearIcon = false;
            });
          },
          child: Icon(
            _isValid ? Icons.check_circle : Icons.clear_rounded,
            color: _isValid ? Colors.green : Colors.red,
            size: 20.0,
          ),
        )
            : null,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        errorText: _showError ? 'Invalid input' : null,
      ),
      validator: (value) {
        final errorText = widget.validator(value);
        setState(() {
          _isValid = errorText == null;
        });
        return errorText;
      },
      onChanged: (value) {
        widget.onChanged(value); // Call the onChanged callback
        final cursorPosition = widget.controller.selection;
        widget.controller.value = widget.controller.value.copyWith(
          text: value,
          selection: cursorPosition,
        );
        _validateInput();
        if (_showError && _isValid) {
          setState(() {
            _showError = false;
          });
        }
      },
      onTap: () {
        setState(() {
          _isFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isFocused = false;
        });
      },
      focusNode: FocusNode(),
    );
  }
}


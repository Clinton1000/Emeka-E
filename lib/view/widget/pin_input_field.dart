import 'package:flutter/material.dart';

class PinInputField extends StatefulWidget {
  final int pinLength;
  final ValueChanged<String> onChanged;

  PinInputField({
    this.pinLength = 4,
    this.onChanged,
  });

  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  List<FocusNode> _focusNodes;
  List<TextEditingController> _controllers;
  List<bool> _isPinFilled;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.pinLength, (index) => FocusNode());
    _controllers = List.generate(widget.pinLength, (index) => TextEditingController());
    _isPinFilled = List.generate(widget.pinLength, (index) => false);
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _onPinChanged(int index, String value) {
    if (value.length > 1) {
      value = value.substring(0, 1);
    }

    setState(() {
      _isPinFilled[index] = value.isNotEmpty;
    });

    if (value.isNotEmpty && index < widget.pinLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    widget.onChanged?.call(_getPinValue());
  }

  String _getPinValue() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.pinLength,
            (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 48,
                  color: _isPinFilled[index] ? Colors.green : Colors.grey,
                ),
                TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 0,
                    color: Colors.transparent,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => _onPinChanged(index, value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

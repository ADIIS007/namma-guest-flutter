import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  final String label;
  final bool isSelected;

  const SelectionButton({super.key, required this.label, required this.isSelected});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:
          const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: widget.isSelected ? Colors.deepPurpleAccent : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
            widget.label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              color: widget.isSelected ? Colors.deepPurpleAccent : Colors.grey,
            ),
        ),
      ),
    );
  }
}

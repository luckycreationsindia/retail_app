import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    this.initialSelection,
    required this.dropdownMenuEntries,
    this.onSelected,
    this.isExpanded = true, this.fontSize = 15,
  });

  final T? initialSelection;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final ValueChanged<T?>? onSelected;
  final bool isExpanded;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      initialSelection: initialSelection,
      dropdownMenuEntries: dropdownMenuEntries,
      onSelected: onSelected,
      menuStyle: const MenuStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color(0xFF171B2D),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      textStyle: TextStyle(fontSize: fontSize),
    );
  }
}

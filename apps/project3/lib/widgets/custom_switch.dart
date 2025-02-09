import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
      value: value,
      activeColor: Colors.purple,
      onChanged: onChanged,
    );
  }
}

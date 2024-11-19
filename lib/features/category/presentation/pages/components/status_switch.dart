import 'package:flutter/material.dart';

class StatusSwitch extends StatelessWidget {
  final ValueNotifier<bool> statusController;
  final String label;

  const StatusSwitch({
    super.key,
    required this.statusController,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        ValueListenableBuilder<bool>(
          valueListenable: statusController,
          builder: (context, value, _) {
            return Switch(
              value: value,
              onChanged: (newValue) => statusController.value = newValue,
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';

class CuDatePicker extends StatelessWidget {
  final Function(DateTime value) onDateChange;
  const CuDatePicker({
    super.key,
    required this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400.0,
      ),
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        maximumDate: DateTime.now(),
        minimumYear: 2018,
        maximumYear: 2020,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onDateChange ?? (DateTime value) {},
      ),
    );
  }
}

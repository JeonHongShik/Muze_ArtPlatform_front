import 'package:flutter/cupertino.dart';

class ToggleDatePicker extends StatelessWidget {
  final Function(BuildContext context) showPicker;

  const ToggleDatePicker({
    super.key,
    required this.showPicker,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text(
        'OPEN DATE PICKER',
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        showPicker(context);
      },
    );
  }
}

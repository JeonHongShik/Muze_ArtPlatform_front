import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandlePickerButton extends StatelessWidget {
  final Function()? onPressCancel;
  final Function()? onPressDone;

  const HandlePickerButton({
    super.key,
    this.onPressCancel,
    this.onPressDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          onPressed: onPressCancel ??
              () {
                Navigator.pop(context);
              },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: onPressCancel ??
              () {
                Navigator.pop(context);
              },
          child: const Text(
            'Done',
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: unused_import

import 'package:artplatform/widgets/cudatepicker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:artplatform/util.dart';
import 'package:artplatform/widgets/handle_picker_button.dart';
import 'package:artplatform/widgets/toggle_date_picker_button.dart';

class Calendar extends StatelessWidget {
  final Function(DateTime value) onDateChange;
  const Calendar({
    super.key,
    required this.onDateChange,
  });

  Future<void> showPicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: getHeightByPercentOfScreen(33.0, context),
          child: const Column(
            children: [
              Expanded(
                flex: 3,
                child: HandlePickerButton(),
              ),
              // Expanded(
              //   flex: 7,
              //  child:
              // ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KO'),
        Locale('en', 'US'),
      ],
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Cupertino Date Picker',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ToggleDatePicker(
                  showPicker: showPicker,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:sound_mode/permission_handler.dart';

import '../notification_api.dart';
import 'tabs_screen.dart';

class AlarmScreen extends StatefulWidget {
  AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool isAllowed = false;
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    checkGranted();
  }

  checkGranted() async {
    bool? isGranted = await PermissionHandler.permissionsGranted;

    if (!isGranted!) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Показ уведомлений'),
          content: const Text(
            'Разрешите показ уведомлений в настройках',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отменить'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await PermissionHandler.openDoNotDisturbSetting();
              },
              child: const Text('Разрешить'),
            )
          ],
        ),
      );
    }
    if (isGranted) {
      isAllowed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Будильник'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimePickerSpinner(
              onTimeChange: (time) {
                setState(() {
                  _dateTime = time;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        child: Text('Установить'),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              TabsScreen.routeName, (Route<dynamic> route) => false,
              arguments: _dateTime);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

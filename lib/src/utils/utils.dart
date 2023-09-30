import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// initWindow() async {
//   await windowManager.ensureInitialized();
//   WindowOptions windowOptions = const WindowOptions(
//     fullScreen: true,
//     backgroundColor: Colors.transparent,
//     skipTaskbar: true,
//     titleBarStyle: TitleBarStyle.hidden,
//     alwaysOnTop: true,
//     center: true,
//     windowButtonVisibility: false,
//   );
//   await windowManager.setPreventClose(true);
//   await windowManager.setClosable(false);
//   await windowManager.setMovable(false);
//   await windowManager.setResizable(false);
//   windowManager.waitUntilReadyToShow(windowOptions, () async {
//     await windowManager.show();
//     await windowManager.focus();
//   });
// }

Future<void> showAlertDialog(BuildContext context,
    {required String title, required String message}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Dismiss'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
  required Function() onConfirm,
  Function()? onCancel,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (onCancel != null) {
                onCancel();
                return;
              }
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onConfirm,
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}

void showSnackMessage(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(content: Text(message), showCloseIcon: true);
  ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
  ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
}

void printDebug(Object? err) {
  if (err != null) {
    if (kDebugMode) {
      print(err);
    }
  }
}

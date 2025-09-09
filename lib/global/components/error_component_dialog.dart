import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:listaai/global/exceptions/failure.dart';

Future<void> showErrorComponentDialog({
  required BuildContext context,
  required Failure error,
  String? title,
}) async {
  final dialogTitle = title ?? 'Erro';
  final dialogMessage = error.message;

  if (Theme.of(context).platform == TargetPlatform.iOS) {
    await showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(dialogTitle),
        content: Text(dialogMessage),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK', style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  } else {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(dialogTitle),
        content: Text(dialogMessage),
        actions: [
          TextButton(
            child: const Text('OK', style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }
}

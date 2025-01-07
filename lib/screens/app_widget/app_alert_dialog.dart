import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String title, content;
  final Orientation orientation;

  const AppAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.orientation});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      contentPadding: const EdgeInsets.all(20.00),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: (orientation == Orientation.portrait)
              ? MediaQuery.of(context).size.height * 0.06
              : MediaQuery.of(context).size.height * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .33,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Edit"),

                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

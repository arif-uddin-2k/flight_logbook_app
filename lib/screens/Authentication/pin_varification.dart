import 'package:flutter/material.dart';

class PinVarification extends StatefulWidget {
  const PinVarification({super.key});

  @override
  State<PinVarification> createState() => _PinVarificationState();
}

class _PinVarificationState extends State<PinVarification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height:MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Text("Enter Your pin"),

            ],
          ),
        ),
      )
    );
  }
}

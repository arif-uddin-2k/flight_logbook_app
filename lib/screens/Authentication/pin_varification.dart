import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/app_colors.dart';

class PinVarificationScreen extends StatefulWidget {
  const PinVarificationScreen({super.key});

  @override
  State<PinVarificationScreen> createState() => _PinVarificationScreenState();
}

class _PinVarificationScreenState extends State<PinVarificationScreen> {
  TextEditingController _pinController = TextEditingController();
  String? _currentPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Text(
              "Password Reset",
              style: Theme.of(context).textTheme.titleLarge,
            )),
            Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Text(
              "We sent a code to 'example@gmail.com'",
              style: Theme.of(context).textTheme.titleSmall,
            )),
            const SizedBox(
              height: 30,
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: _pinController,
              onChanged: (value){
                setState(() {
                  _currentPin = value;
                });
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 40,
                fieldWidth: 40,
                activeColor: Colors.blue,
                selectedColor: Colors.redAccent,
                inactiveColor: Colors.grey,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30,),
            SizedBox(
              height: MediaQuery.sizeOf(context).height*.05,
              width: MediaQuery.sizeOf(context).width*.9,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPin != null && _currentPin!.length == 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('PIN Verified: $_currentPin')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a valid 4-digit PIN')),
                    );
                  }
                },
                child: const Text('Verify'),
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive email?", style: Theme.of(context).textTheme.displaySmall,),
                const SizedBox(width: 4),
                InkWell(onTap: () {}, child: Text("Tap to resend",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 12,
                ),),),
              ],),
            const SizedBox(height: 15,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Back to sign in",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

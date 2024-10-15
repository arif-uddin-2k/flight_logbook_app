import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height:MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  "Set Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),

              ),
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.4),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Enter Password'),
                    hintText: "Minimum 6 Characters",
                    suffixIcon: Icon(Icons.remove_red_eye)
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Confirm Password'),
                      hintText: "Retype Password",
                      suffixIcon: Icon(Icons.remove_red_eye)
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

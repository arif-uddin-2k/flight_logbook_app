import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                SizedBox(
                    child: Text(
                  "Forgot Password?",
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
                  "No worries,we'll send you reset instructions.",
                  style: Theme.of(context).textTheme.titleSmall,
                )),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      hintText: "Enter your email",
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
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.whiteColor,
                              ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black54,
                          ),
                          SizedBox(
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
        ),
      ),
    );
  }
}

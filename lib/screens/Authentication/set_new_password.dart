import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(padding: EdgeInsets.all(64),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(
                 child: Text(
                   "Set New Password",
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
                   "Must be at least 8 characters.",
                   style: Theme.of(context).textTheme.titleSmall,
                 )),
             const SizedBox(
               height: 30,
             ),
             SizedBox(
               width: MediaQuery.of(context).size.width * 0.7,
               child: TextFormField(
                 decoration: const InputDecoration(
                   label: Text('Password'),
                   hintText: "New Password",
                   suffixIcon: Icon(Icons.remove_red_eye_sharp),
                 ),
               ),
             ),
             const SizedBox(
               height: 30,
             ), SizedBox(
               width: MediaQuery.of(context).size.width * 0.7,
               child: TextFormField(
                 decoration: const InputDecoration(
                   label: Text('Confirm Password'),
                   suffixIcon: Icon(Icons.remove_red_eye_sharp),
                   hintText: "Confirm New Password",
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
    );
  }
}

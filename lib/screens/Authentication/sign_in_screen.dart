import 'package:flight_log_book/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height:  MediaQuery.of(context).size.height * 0.8,
              width:  MediaQuery.of(context).size.width * 0.8,
              child: Form(
                child: Column(

                  children: [
                    SizedBox(
                      // height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          hintText: "Email or Phone Number",
                          suffixIcon: Icon(Icons.person_2_outlined),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      // height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          hintText: "Password",
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Sign In',
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.whiteColor,
                              ))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      child: InkWell(onTap: () {}, child: Text("Forgot Password?",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 12,
                      ),),),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Or sign in with',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: const  Icon(Icons.facebook))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Don't have an account?", style: Theme.of(context).textTheme.displaySmall,),
                      const SizedBox(width: 4),
                      InkWell(onTap: () {}, child: Text("Register",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 12,
                      ),),),
                    ],),

                  ],
                ),
              ),
            ),

          ),



        ],
      ),
    );
  }
}

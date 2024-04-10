import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: emailController),
        TextField(
          controller: passwordController,
          obscureText: true,
        ),
        MaterialButton(
          onPressed: () async {
            final sm = ScaffoldMessenger.of(context);
            final authResponse = await supabase.auth.signUp(
                password: passwordController.text, email: emailController.text);

            sm.showSnackBar(SnackBar(
                content: Text("Logged In: ${authResponse.user!.email!}")));
          },
          child: Text("Sign Up"),
        )
      ],
    );
  }
}

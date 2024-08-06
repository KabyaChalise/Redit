import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controller/auth_controller.dart';
import 'package:reddit/theme/pallet.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});
  
  void signInWithGoogle(WidgetRef ref){
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => signInWithGoogle(ref),
      label: const Text(
        'Log In',
        style: TextStyle(fontSize: 18),
      ),
    
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Pallete.greyColor,
        minimumSize: const Size(double.infinity, 50),
      )
    );
  }
}

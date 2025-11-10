import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../auth/screens/login_screen.dart';
import '../auth/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: const Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()),
                      );
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

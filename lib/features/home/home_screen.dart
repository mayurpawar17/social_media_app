import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      body: Center(
        child: Text("Email : $email", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

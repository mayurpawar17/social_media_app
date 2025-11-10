import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/auth/bloc/auth_bloc.dart';
import 'features/onboarding/welcome_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthBloc())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/loading_overlay.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../home/home_screen.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      // backgroundColor: AppColors.primary,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Login Successfully")));

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(email: state.email),
              ),
            );
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthNavigateToLoginState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Main content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        'Create an Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sign up to continue',
                        style: TextStyle(
                          // fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Email field
                      CustomTextField(
                        controller: emailEditingController,
                        hint: 'Full Name',
                      ),
                      const SizedBox(height: 20),

                      // Email field
                      CustomTextField(
                        controller: emailEditingController,
                        hint: 'Email Address',
                      ),
                      const SizedBox(height: 20),

                      // Password field
                      CustomTextField(
                        obscureText: state is ObscureButtonState
                            ? state.isObscure
                            : true,
                        controller: passwordEditingController,
                        hint: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(ObscureButtonEvent());
                          },
                          icon: state is ObscureButtonState && !state.isObscure
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Login Button
                      CustomButton(text: "Sign Up", onPressed: () {}),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.center,
                        child: Text('or'),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.apple),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () => context.read<AuthBloc>().add(
                              NavigateToLoginEvent(),
                            ),
                            child: Text(
                              'Sign In',

                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Centered Lottie Loading Overlay
              if (state is AuthLoadingState) buildLoadingOverlay(),
            ],
          );
        },
      ),
    );
  }
}

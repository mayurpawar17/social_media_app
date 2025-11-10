import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildLoadingOverlay() {
  return Container(
    color: Colors.black.withOpacity(0.5),
    child: Center(
      child: Lottie.asset('assets/Wind.json', height: 100, width: 100),
    ),
  );
}

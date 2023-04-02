import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: body,
      width: size.width,
      height: size.height,
      child: Center(child: Text("ProfileScreens")),
    );
  }
}
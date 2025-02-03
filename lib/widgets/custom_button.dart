import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/colors.dart';

typedef CustomButtonBuilder = CustomButton Function(
    String title,
    bool showActions,
    double fontSize,
    );

class CustomButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    this.title,
    this.showActions = true,
    this.fontSize,
    required this.onPressed,
  });

  final String? title;
  final double? fontSize;

  final bool showActions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3b74ed), Color(0xff39eb5a)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: (showActions) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: (fontSize == null)?25:fontSize),
                ),
                if (showActions) Icon(Icons.arrow_forward, color: Colors.white, size: 30), // Right arrow icon
              ],
            ),
          ),
        ),
      ),

    );
  }
}
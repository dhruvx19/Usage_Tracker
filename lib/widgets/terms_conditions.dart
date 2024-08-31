import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Terms and condition widget
class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  bool isChecked = false; // Move the variable here

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'By continuing, you agree to ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.lightBlue,
                    decoration: TextDecoration.underline, // Optional: underline text
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle tap on Terms & Conditions
                    },
                ),
                const TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.lightBlue,
                    decoration: TextDecoration.underline, // Optional: underline text
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle tap on Privacy Policy
                    },
                ),
                const TextSpan(
                  text: '.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

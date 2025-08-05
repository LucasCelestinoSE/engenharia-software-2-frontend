import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      style: ElevatedButton.styleFrom(
        
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size.fromHeight(48),
      ),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
    );
  }
}

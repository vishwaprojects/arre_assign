import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16),
              child: Image.asset(
                "assets/logo_arre.png",
                scale: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 24),
              child: Row(
                children: const [
                  Icon(Icons.notifications, color: Colors.white),
                  SizedBox(width: 8),
                  Icon(Icons.chat, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

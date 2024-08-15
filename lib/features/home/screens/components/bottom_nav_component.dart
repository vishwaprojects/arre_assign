import 'package:arre_assign/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  final int selectedBottom;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedBottom,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBorderCurved = ref.watch(homeRef).showBottomPlayer;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(isBorderCurved ? 0 : 30),
          topLeft: Radius.circular(isBorderCurved ? 0 : 30),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isBorderCurved ? 0 : 30.0),
          topRight: Radius.circular(isBorderCurved ? 0 : 30.0),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedBottom,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.mic), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}

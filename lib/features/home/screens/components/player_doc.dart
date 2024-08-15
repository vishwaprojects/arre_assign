import 'package:arre_assign/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class PlayerDock extends ConsumerWidget {
  const PlayerDock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPlayer = ref.watch(homeRef).showBottomPlayer;
    final isClicked = ref.watch(homeRef).isClicked;

    return Visibility(
      visible: showPlayer && isClicked,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text(
                "How to make your business grow..",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "@username",
                style: TextStyle(color: Colors.green),
              ),
              trailing: const PlayerControls(),
            ),
            const ProgressBar(),
          ],
        ),
      ),
    );
  }
}

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.favorite, color: Colors.white),
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
          Icon(Icons.more_horiz, color: Colors.white),
        ],
      ),
    );
  }
}

class ProgressBar extends ConsumerWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LinearProgressBar(
      maxSteps: 6,
      progressType: LinearProgressBar.progressTypeLinear,
      currentStep: 1,
      progressColor: Colors.red,
      backgroundColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    );
  }
}

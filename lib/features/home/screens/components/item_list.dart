import 'package:arre_assign/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemList extends ConsumerWidget {
  final ScrollController scrollController;

  const ItemList({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      itemCount: 16,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            final homeReference = ref.read(homeRef);
            homeReference.updateIsClicked(true);
            homeReference.updateBottomPlayer(true);
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Image.asset("assets/image.png"),
          ),
        );
      },
    );
  }
}

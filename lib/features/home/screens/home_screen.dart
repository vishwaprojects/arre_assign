import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:arre_assign/features/home/controller/home_controller.dart';
import 'package:arre_assign/features/home/screens/components/bottom_nav_component.dart';
import 'package:arre_assign/features/home/screens/components/item_list.dart';
import 'package:arre_assign/features/home/screens/components/player_doc.dart';
import 'package:arre_assign/features/home/screens/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedBottom = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        ref.read(homeRef).updateBottomPlayer(false);
      } else {
        ref.read(homeRef).updateBottomPlayer(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedBottom: _selectedBottom,
        onTap: (value) {
          setState(() {
            _selectedBottom = value;
          });
        },
      ),
      bottomSheet: const PlayerDock(),
      body: Stack(
        children: [
          ItemList(scrollController: _scrollController),
          const TopBar(),
        ],
      ),
    );
  }
}

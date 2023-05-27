import 'package:flutter/material.dart';
import 'package:mybookstore/core/widgets/bottom_bar_widget.dart';
import 'package:mybookstore/pages/home/mixins/home_provider.dart';

class ControllerHomePage extends StatefulWidget {
  const ControllerHomePage({super.key});

  @override
  State<ControllerHomePage> createState() => _ControllerHomePageState();
}

class _ControllerHomePageState extends State<ControllerHomePage>
    with HomeProvider {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    initPages(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomBarWidget(
        selectedIndex: index,
        onTap: onTap,
      ),
    );
  }

  onTap(int value) {
    setState(() {
      index = value;
      controller.animateToPage(value,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }
}

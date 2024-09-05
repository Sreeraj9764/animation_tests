import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 300.0)
        .animate(SizedAnimation(parent: controller));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            print(controller.value);
            print(animation.value);
            print(controller.status);
            if (controller.status != AnimationStatus.forward &&
                controller.status == AnimationStatus.completed) {
              controller.reverse();
            }
            return Container(
              width: animation.value,
              height: animation.value,
              color: Colors.green,
            );
          },
        ),
      ),
    );
  }
}

class SizedAnimation extends CurvedAnimation {
  SizedAnimation({
    required super.parent,
  }) : super(
            curve: const Interval(0, 1))
          ;
}

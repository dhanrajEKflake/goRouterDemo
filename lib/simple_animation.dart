import 'package:flutter/material.dart';

class SimpleAnimationDemo extends StatefulWidget {
  const SimpleAnimationDemo({super.key});

  @override
  _SimpleAnimationDemoState createState() => _SimpleAnimationDemoState();
}

class _SimpleAnimationDemoState extends State<SimpleAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 1.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Simple Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Press Me',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

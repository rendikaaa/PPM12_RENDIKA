import 'package:flutter/material.dart';

void main() {
  runApp(const MovingBoxApp());
}

class MovingBoxApp extends StatelessWidget {
  const MovingBoxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovingBoxScreen(),
    );
  }
}

class MovingBoxScreen extends StatefulWidget {
  @override
  _MovingBoxScreenState createState() => _MovingBoxScreenState();
}

class _MovingBoxScreenState extends State<MovingBoxScreen> {
  double _left = 50.0; // Initial position
  double _top = 50.0;

  void _moveBox() {
    setState(() {
      // Move the box to a new random position
      _left = _left == 50.0 ? 200.0 : 50.0;
      _top = _top == 50.0 ? 300.0 : 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Box Animation'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _left,
            top: _top,
            child: GestureDetector(
              onTap: _moveBox,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _moveBox,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

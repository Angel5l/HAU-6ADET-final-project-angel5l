import 'package:flutter/material.dart';
import '/pages/cardTinder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.search),
                ),
                fillColor: const Color.fromARGB(255, 212, 212, 212),
                filled: true,
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.blue.withValues(alpha: 0.04);
              }
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.pressed)) {
                return Colors.blue.withValues(alpha: 0.12);
              }
              return null; // Defer to the widget's default.
            }),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cardTinder()),
            );
          },
          child: Text('Start Reading'),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Angel's Tarot App",
        style: TextStyle(
          fontFamily: 'Merriweather',
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}

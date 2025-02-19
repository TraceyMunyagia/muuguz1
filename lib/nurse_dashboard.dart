import 'package:flutter/material.dart';

class NurseDashboard extends StatefulWidget {
  const NurseDashboard({super.key});

  @override
  State<NurseDashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NurseDashboard> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      appBar: AppBar(
        title: Text('Muuguzi', textAlign: TextAlign.center,),
        backgroundColor: Colors.blue,
        ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Patient',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Patient Schedule',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed),
            );
  }
}
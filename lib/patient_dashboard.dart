import 'package:flutter/material.dart';
import 'package:muuguzi/home_screen.dart';
import 'package:muuguzi/nurse_screen.dart';
import 'package:muuguzi/profile_screen.dart';
import 'package:muuguzi/schedule_screen.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PatientDashboard> {
  int myIndex = 0;
  List<Widget> widgetList =const [
  HomeScreen(),
  NurseScreen(),
  ScheduleScreen(),
  ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar: AppBar(
       // title: Text('Muuguzi', textAlign: TextAlign.center,),
        //backgroundColor: Colors.blue,
       // ),
        body:IndexedStack(
          children: widgetList,
          index: myIndex,
        ),
        backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex=index;
          });
        },
        fixedColor: Colors.blue,
        currentIndex: myIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Nurse',
          ),
           const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Schedule',
          ),
           const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed),
            );
  }
}
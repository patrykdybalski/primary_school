import 'package:flutter/material.dart';
import 'package:primary_school/app/features/home/pages/calendar_page/calendar_page.dart';
import 'package:primary_school/app/features/home/pages/notes_page/notes_page.dart';
import 'package:primary_school/app/features/home/pages/user_page/user_page.dart';
import 'package:primary_school/app/features/home/pages/weather_page/weather_page.dart';
import 'package:primary_school/constans/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const CalendarPage();
          }
          if (currentIndex == 1) {
            return const NotesPage();
          }
          if (currentIndex == 2) {
            return const WeatherPage();
          }
          return const UserPage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.redColor,
        unselectedItemColor: AppColors.secondaryColor,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            label: 'Plany',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notes_outlined,
            ),
            label: 'Notatki',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'Pogoda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

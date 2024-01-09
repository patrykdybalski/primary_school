import 'package:flutter/material.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/search_widget.dart';

class InitialWeatherScreen extends StatelessWidget {
  const InitialWeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 320,
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.outline,
                    Theme.of(context).colorScheme.outlineVariant,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    blurRadius: 1,
                    offset: const Offset(1, 0),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/term.png',
                    height: 200,
                    width: 100,
                  ),
                ],
              ),
            ),
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}

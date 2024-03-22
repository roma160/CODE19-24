import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:start_hack_gallen/screens/camera.dart';
import 'package:start_hack_gallen/screens/data_filter.dart';
import 'package:start_hack_gallen/screens/info_list.dart';
import 'package:start_hack_gallen/screens/welcome_screeen.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 164, 178, 124),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
        child: MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: true,
      title: 'Great Places',
      home: const WelcomePage(),
    )),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final bottomWidgetList = [
    const InfoList(),
    const DataFilter(),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NutriPlates')),
      body: bottomWidgetList[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: colorScheme.onBackground,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: colorScheme.onBackground,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: colorScheme.onBackground,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                }),
            const SizedBox(
                width: 48), // The empty space for the floating button
          ],
        ),
      ),
      floatingActionButton: const CameraInput(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

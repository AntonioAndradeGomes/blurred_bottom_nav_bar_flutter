import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurred_bottom_nav_bar/app_theme.dart';
import 'package:blurred_bottom_nav_bar/item_page.dart';
import 'package:blurred_bottom_nav_bar/my_custom_clipper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: const FinalViewPage(),
    );
  }
}

class FinalViewPage extends StatefulWidget {
  const FinalViewPage({super.key});

  @override
  State<FinalViewPage> createState() => _FinalViewPageState();
}

class _FinalViewPageState extends State<FinalViewPage> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Blurred Bottom Navigation Bar',
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 40,
            itemBuilder: (_, index) {
              return Card(
                color: theme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: AutoSizeText(
                        '@antonioandrade27',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        presetFontSizes: const [20, 15, 12, 10],
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 18,
            left: 18,
            right: 18,
            height: 86,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: theme.scaffoldBackgroundColor,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(52),
                  bottomRight: Radius.circular(52),
                ),
                color: theme.scaffoldBackgroundColor.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(52),
                  bottomRight: Radius.circular(52),
                ),
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 8,
                      sigmaY: 8,
                    ),
                    child: Container(),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 18,
            left: 22,
            right: 22,
            height: 86,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                ItemPage(
                  icon: Icons.home_outlined,
                  isSelected: selectedItem == 0,
                  onTap: () {
                    setState(() {
                      selectedItem = 0;
                    });
                  },
                ),
                ItemPage(
                  icon: Icons.apps,
                  isSelected: selectedItem == 1,
                  onTap: () {
                    setState(() {
                      selectedItem = 1;
                    });
                  },
                ),
                ItemPage(
                  icon: Icons.notifications_outlined,
                  isSelected: selectedItem == 2,
                  onTap: () {
                    setState(() {
                      selectedItem = 2;
                    });
                  },
                ),
                ItemPage(
                  icon: Icons.settings_outlined,
                  isSelected: selectedItem == 3,
                  onTap: () {
                    setState(() {
                      selectedItem = 3;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

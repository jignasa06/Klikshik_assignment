import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jignasa_album_practical/constants/text_constants.dart';

import 'constants/route_constants.dart';
import 'features/album/album_grid_screen.dart';
import 'features/auth/auth_screen.dart';
import 'features/auth/loading_screen.dart';
import 'features/events/events_list_screen.dart';
import 'features/photo/photo_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "${TextConstants.appTitle} ${TextConstants.album}",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const AuthScreen(),
        RouteConstants.loading: (context) => const LoadingScreen(),
        RouteConstants.events: (context) => const EventsListScreen(),
        RouteConstants.albums: (context) => const AlbumGridScreen(),
        RouteConstants.photo: (context) => PhotoScreen(),
      },
    );
  }
}

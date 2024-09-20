import 'package:chat_apps/core/di/injector.dart';
import 'package:chat_apps/core/service/firebase_service.dart';
import 'package:chat_apps/feature/chat/provider/chat_provider.dart';
import 'package:chat_apps/feature/home_page.dart';
import 'package:chat_apps/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/di/injector.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider(di<FirebaseService>())),
      ],
      child: MaterialApp(
        title: 'Chat Boot Apps',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage()
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:postableapp/imagepost.dart';
import 'package:postableapp/service/context_utility.dart';
import 'package:postableapp/service/uni_service.dart';
import 'package:postableapp/textpost.dart';
import 'package:postableapp/videopost.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtitlity.naviogatorKey,
      routes: {
        '/': (_) => const MyHomePage(),
        '/image': (_) => const ImagePost(),
        '/video': (_) => const VideoPost()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  // Define the paths corresponding to the tabs
  static const tabPaths = [TextPost(), VideoPost(), ImagePost()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Post Share App'),
      ),
      body: tabPaths[currentIndex], // Display the child (current page)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          // Navigate using GoRouter
        },
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet), label: "Text Post"),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Video Post"),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam), label: "Image Post"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rikmorti/presentation/screens/home_screen.dart';
import 'package:rikmorti/resources/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
routing ();
    super.initState();
  }
  
  Future<void> routing () async { 
await Future.delayed(const Duration(seconds: 3),);
 Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen()),),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppPngs.splash
      ),
    );
  }
}





import 'package:camera/camera.dart';
import 'package:chatpp/Screens/CameraScreen.dart';
import 'package:chatpp/Screens/HomeScreen.dart';
import 'package:chatpp/Screens/LoginScreen.dart';
import 'package:chatpp/pages/CameraPage.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
cameras = await availableCameras();
// final firstCamera = cameras!.first;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Roboto ",
        appBarTheme: AppBarTheme(
             color: Colors.black, iconTheme: IconThemeData(color: Colors.white)),
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.black,
      ),
      home:LoginScreen(),
    );
  }
}

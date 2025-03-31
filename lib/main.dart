import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MoistMeter/screens/intro.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:MoistMeter/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'package:MoistMeter/screens/home.dart';
import 'package:MoistMeter/screens/map.dart';
import 'package:MoistMeter/screens/add.dart';
import 'package:MoistMeter/screens/calender.dart';


Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: ".env");

  MapboxOptions.setAccessToken(dotenv.env['MAPBOX_ACCESS_TOKEN']!);

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
    // Logger.root.level = Level.ALL;
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: AlertDialog(
                  title: Text('Error'),
                  content: Text("Something went wrong! Please try again later."),
                ),
              ),
            ),
          );
        }
  
        var userActive = false;
        if (FirebaseAuth.instance.currentUser != null) {
          userActive = true;
          print("EMAIL:");
          print(snapshot.data!.email);

        }
        

 
        return MaterialApp(

          initialRoute: userActive ? '/home' : '/',
          routes: {
            '/': (context) => const IntroductionAnimationScreen(),
            '/signin': (context) => SignInScreen(
              headerBuilder: (context, constraints, _) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset("assets/logos/logoIcon.png")
                    ),
                      
                  ),
                ); 
              },
              providers: [EmailAuthProvider()],
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/home'); // Navigate after sign-in
                }),
              ],
            ),
            '/profile': (context) => ProfileScreen(
              showDeleteConfirmationDialog: true,
              providers: [EmailAuthProvider()],
              appBar: AppBar(
                title: const Text('Profile'),
              ),
              actions: [
                SignedOutAction((context) {
                  Navigator.pushReplacementNamed(context, '/');
                }),
              ],
            ),
            '/home': (context) => HomePage(),
            '/map': (context) => MapPage(),
            '/add': (context) => AddPage(),
            '/calender': (context) => CalenderPage(),
          },

          title: 'MoistMeter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x04A1BF)),
          ),
        );
      }
    );
  }
}


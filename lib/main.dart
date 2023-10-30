import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventorywindowsapp/controller/controller.dart';
import 'package:inventorywindowsapp/screen/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
    child: const MyApp(),
  ));
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(49, 39, 79, 1),
        secondaryHeaderColor: const Color.fromARGB(255, 230, 158, 243),
        // primaryColor: Colors.red[400],
        // accentColor: Color.fromARGB(255, 248, 137, 137),
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: 'Roboto Mono sample',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.acmeTextTheme()
        // scaffoldBackgroundColor: P_Settings.bodycolor,
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(
        //     fontSize: 25.0,
        //   ),
        //   bodyText2: TextStyle(
        //     fontSize: 14.0,
        //   ),
        // ),
      ),

      // home: OpenFileTest(),
      // home:PrintTest() ,
      // home: FileList(),
      // home: FileListComputer(),
      home: HomePage(),
    );
  }
}

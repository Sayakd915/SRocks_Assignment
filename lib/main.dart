import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srocksproject/firebase_options.dart';
import 'package:srocksproject/locator.dart';
import 'package:srocksproject/screens/bottomNavScreen.dart';
import 'package:srocksproject/viewmodels/service_viewmodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServiceViewModel()),
      ],
      child: MaterialApp(
        title: 'SRocks-Home',
        home: NavScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

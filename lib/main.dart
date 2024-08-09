import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nyaya/provider/user_provider.dart';
import 'package:nyaya/features/auth/services/auth_service.dart';
import 'package:nyaya/features/home/screen/home_screen.dart';
import 'package:nyaya/features/auth/screens/auth_screen.dart';
import 'package:nyaya/common/bottom_bar.dart';
import 'package:nyaya/constants/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nyaya/common/loader.dart';
import 'package:nyaya/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('x-auth-token');

  runApp(MyApp(token: token));
}

class MyApp extends StatefulWidget {
  final String? token;

  MyApp({this.token});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    if (widget.token != null && widget.token!.isNotEmpty) {
      
      try {
        await AuthService().getUserData(context);
        setState(() {
          _isAuthenticated = true;
        });
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Nyaya',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _isLoading
            ? Scaffold(
                body: Center(
                  child: Loader(),
                ),
              )
            : HomeScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

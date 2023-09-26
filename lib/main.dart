import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:waya_pay/config/routes/router.dart';
import 'package:waya_pay/config/theme/theme_manager.dart';
import 'package:waya_pay/features/auth/providers/user_provider.dart';
import 'package:waya_pay/features/auth/screens/login_screen.dart';
import 'package:waya_pay/features/auth/services/auth_service.dart';
import 'package:waya_pay/widgets/circular_loader.dart';
import 'package:waya_pay/widgets/home.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future _future;
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _future = obtainTokenAndUserData(context);
  }

  obtainTokenAndUserData(BuildContext context) async {
    await authService.obtainTokenAndUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final ThemeManager themeManager = ThemeManager();
    return MaterialApp(
      title: 'Waya',
      theme: themeManager.darkTheme,
      darkTheme: themeManager.darkTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),
          const Breakpoint(start: 600, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return user.type == "admin" ||
                    user.type == "agent" && user.token.isNotEmpty
                ? const Home()
                : const LoginScreen();
          } else {}

          return const Scaffold(body: CircularLoader());
        },
      ),
      //initialRoute: "/login",
      onGenerateRoute: (settings) => appRoutes(settings),
    );
  }
}

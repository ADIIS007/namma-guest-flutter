import 'package:flutter/material.dart';
import 'package:namma_guest/Screens/Admin/Onboarding/name_onboarding_page.dart';
import 'package:namma_guest/Screens/Main/main_page.dart';
import 'package:namma_guest/Screens/Main/user_page.dart';
import 'package:namma_guest/Service/shared_pref_login.dart';

import 'Screens/Login/login_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
  //       useMaterial3: true,
  //     ),
  //     home: const LoginPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: SharedPrefLogin.getLoginDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading login data'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('No login data available'));
        }

        // Retrieve login details
        String? email = snapshot.data!['token'];
        String? userType = snapshot.data!['type'];

        // Decide navigation based on the userType
        if (email == null || userType == null) {
          return const LoginPage(); // Navigate to user type section if data is null
        } else if (userType == 'USER') {
          return UserPage(); // Navigate to User Main Page
        } else if (userType == 'ADMIN') {
          return const NameOnboardingPage(); // Navigate to Admin Main Page
        } else {
          return const Placeholder(); // Default to user type section
        }
      },
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
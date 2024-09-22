import 'package:flutter/material.dart';
import 'package:namma_guest/Screens/Login/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Image.asset(
                'assets/images/1.png',
                width: 240,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Let's get started",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Never a better time than now to start.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Create Account',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FractionallySizedBox(
//           widthFactor: 0.7,
//           heightFactor: 0.7,
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                 ),
//                 color: Colors.grey[200],
//                 borderRadius: const BorderRadius.all(Radius.circular(20))),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   AnimatedBuilder(
//                     animation: _controller,
//                     builder: (_, __) {
//                       if (_controller.value < 0.5) {
//                         return ScaleTransition(
//                           scale: Tween(begin: 1.0, end: 2.0).animate(
//                             CurvedAnimation(
//                               parent: _controller,
//                               curve:
//                                   Interval(0.0, 0.5, curve: Curves.easeInOut),
//                             ),
//                           ),
//                           child: const Icon(Icons.home, size: 50),
//                         );
//                       } else {
//                         return const SizedBox.shrink();
//                       }
//                     },
//                   ),
//                   AnimatedBuilder(
//                     animation: _controller,
//                     builder: (_, __) {
//                       if (_controller.value >= 0.5) {
//                         return ScaleTransition(
//                           scale: Tween(begin: 0.0, end: 1.0).animate(
//                             CurvedAnimation(
//                               parent: _controller,
//                               curve: const Interval(0.5, 1.0,
//                                   curve: Curves.easeInOut),
//                             ),
//                           ),
//                           child: const Icon(Icons.favorite,
//                               size: 50, color: Colors.red),
//                         );
//                       } else {
//                         return const SizedBox.shrink();
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 20.0),
//                   ElevatedButton(
//                     onPressed: _handleSignIn,
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.white),
//                       padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         const Text(
//                           'Sign in with',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Image.network(
//                           'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
//                           height: 18.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _handleSignIn() async {
//     final authService = AuthService();
//     await authService.signInWithGoogle();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:movies/main.dart';
// import 'package:movies/screens/home.dart';
//
// enum AuthStatus {
//   notLogginIn,
//   loggedIn,
// }
// class Root extends StatefulWidget {
//   const Root({Key? key}) : super(key: key);
//
//   @override
//   State<Root> createState() => _RootState();
// }
//
// class _RootState extends State<Root> {
//   AuthStatus _authStatus = AuthStatus.notLogginIn;
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Widget retVal;
//     switch (_authStatus) {
//       case AuthStatus.notLogginIn:
//         retVal = MyApp();
//         break;
//       case AuthStatus.loggedIn:
//         retVal = HomeScreen();
//         break;
//       default:
//     }
//     return retVal;
//   }
// }

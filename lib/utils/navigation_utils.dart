//import 'package:flutter/material.dart';
//import 'package:navigation/src/home.dart';
//import 'package:navigation/src/second.dart';
//
//const String routeHome = "routeHome";
//const String routeSecond = "routeSecond";
//
//Route<dynamic> generateRoute(
//  BuildContext context,
//  RouteSettings settings,
//) {
//  final Map<String, dynamic> args = settings.arguments;
//
//  switch (settings.name) {
//    case routeHome:
//      return MaterialPageRoute(builder: (_) => HomeScreen());
//    case routeSecond:
//      return MaterialPageRoute(builder: (_) => SecondScreen());
//    default:
//      return _errorRoute(" Comming soon...");
//  }
//}
//
//Route<dynamic> _errorRoute(String message) {
//  return MaterialPageRoute(builder: (_) {
//    return Scaffold(
//        appBar: AppBar(title: Text('Error')),
//        body: Center(child: Text(message)));
//  });
//}

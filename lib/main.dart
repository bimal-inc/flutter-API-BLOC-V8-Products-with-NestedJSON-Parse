import 'package:api_testing/bloc/productdata_bloc.dart';
import 'package:api_testing/screens/home_screen.dart';
import 'package:api_testing/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<ProductdataBloc>(
    create: (context) => ProductdataBloc(ProductRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: const HomePage()),
    );
  }
}

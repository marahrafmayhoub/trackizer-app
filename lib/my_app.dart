import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/custom_button.dart';
import 'package:trackizer/core/widgets/gradient_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      appBar: AppBar(title: Text('data')),

      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              gradientButton(text: 'heoll', onPressed: () {}),

              SizedBox(height: 40,),
              customButton(text: 'meme',onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}

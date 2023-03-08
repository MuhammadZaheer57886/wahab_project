import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
            child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_atippmse.json'),
            
          ),
        
      );
  }
}
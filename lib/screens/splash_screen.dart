import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_york_times_articles/controllers/splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key, this.mockedController}) : super(key: key);

  final SplashController? mockedController;
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.mockedController ?? SplashController();
    controller.getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 110,
            ),
            const Text(
              'The New York Times',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            if (Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}

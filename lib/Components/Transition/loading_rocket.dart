import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solar_system_app/constants.dart';

// ignore: must_be_immutable
class LoadingRocket extends StatefulWidget {
  bool active = false;

  LoadingRocket({this.active = false, super.key});

  @override
  State<LoadingRocket> createState() => _LoadingRocketState();
}

class _LoadingRocketState extends State<LoadingRocket> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    setState(() {
      isActive = widget.active;
    });
    Timer.periodic(
        const Duration(seconds: 3),
        (_) => setState(() {
              if (isActive) {
                isActive = false;
              } else {
                isActive = true;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [SpaceColor, SkyColor],
          )),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(top: 0, child: Lottie.asset('lottie/space.json')),
              AnimatedAlign(
                alignment:
                    isActive ? Alignment.bottomCenter : Alignment.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: SizedBox(
                  height: 250,
                  child: Lottie.asset('lottie/rocket.json'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

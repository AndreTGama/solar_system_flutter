import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:solar_system_app/Components/Buttons/button_rounded.dart';
import 'package:solar_system_app/Components/Text/text_colors.dart';
import 'package:solar_system_app/Screens/SolarSystem/solar_system_screen.dart';
import 'package:solar_system_app/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              Positioned(top: 0, child: Lottie.asset('assets/lottie/space.json')),
              Positioned(
                top: size.height * 0.2,
                child: SizedBox(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: size.height * 0.5,
                        width: size.width * 0.7,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 245, 243, 255),
                              Color.fromARGB(255, 236, 236, 255)
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 57, 21, 90)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(4, 8),
                            ),
                          ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 50),
                            TextColors(text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                            SizedBox(height: 25),
                          ],
                        )),
                  ],
                )),
              ),
              Positioned(
                top: size.height * 0.05,
                child: SizedBox(
                    height: 200,
                    child: SimpleShadow(
                      child: Lottie.asset('assets/lottie/human-space.json'),
                    )),
              ),
              Positioned(
                  top: size.height * 0.67,
                  child: ButtonRounded(
                    text: "Vamos nessa",
                    press: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, a, b) => const SolarSystemScreen(),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        )
                      );
                    }
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}

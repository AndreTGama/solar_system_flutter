import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:solar_system_app/Model/PlanetsModel.dart';
import 'package:solar_system_app/Screens/Planet/planet_screen.dart';
import 'package:solar_system_app/constants.dart';

class CardComoponet extends StatelessWidget {
  final PlanetsModel planet;
  final Color color, textColor;

  const CardComoponet(
    {
      required this.planet,
      this.color = SkyColor,
      this.textColor = Colors.white,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 350,
          width: size.width * 0.7,
          margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 5),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white
              ],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 57, 21, 90).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: Text(
            planet.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 6,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Daruma',
              color: Color.fromARGB(255, 32, 32, 32)
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Hero(
            tag: planet.id,
            child: SimpleShadow(
              sigma: 10,
              child: Image.asset(planet.image, height: size.height * 0.3,)
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, a, b) => PlanetScreen(planet: planet),
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
            },
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(2.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.arrow_circle_right,
              color: Colors.yellow,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solar_system_app/Components/Text/general_characteristics.dart';
import 'package:solar_system_app/Components/Text/title_component.dart';
import 'package:solar_system_app/Models/PlanetsModel.dart';
import 'package:solar_system_app/constants.dart';

class PlanetScreen extends StatelessWidget {
  final PlanetsModel planet;

  const PlanetScreen({required this.planet, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(children: <Widget>[
            Positioned(
                top: 5,
                left: 0,
                child: Text(planet.id.toString(),
                    style: const TextStyle(
                        fontSize: 300,
                        color: Color.fromARGB(255, 223, 223, 223)))),
            Positioned(
              top: -30,
              right: -50,
              child: Hero(tag: planet.id, child: Image.asset(planet.image)),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 300,
                    ),
                    Text(
                      planet.name.toString(),
                      style: const TextStyle(
                          fontSize: 55,
                          fontFamily: 'Daruma',
                          color: NamePlanet,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      'Sistema Solar',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Daruma',
                          color: NameSystem,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: size.width * 0.95,
                      child: Text(
                        planet.description.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Daruma',
                            color: DescriptionPlanet,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TitleComponent(title: 'Características gerais'),
                    GeneralCharacteristics(
                        title: 'Diâmetro',
                        description: planet.diameter.toString()),
                    GeneralCharacteristics(
                        title: 'Massa', description: planet.weight.toString()),
                    GeneralCharacteristics(
                        title: 'Distância do Sol',
                        description: planet.distanceSun.toString()),
                    GeneralCharacteristics(
                        title: 'Gravidade',
                        description: planet.gravity.toString()),
                    GeneralCharacteristics(
                        title: 'Rotação',
                        description: planet.rotation.toString()),
                    GeneralCharacteristics(
                        title: 'Translação',
                        description: planet.translation.toString()),
                    GeneralCharacteristics(
                        title: 'Temperatura',
                        description: planet.temperature.toString()),
                    const SizedBox(
                      height: 30,
                    ),
                    const TitleComponent(title: 'Curiosidade'),
                    SizedBox(
                      width: size.width * 0.95,
                      child: Text(
                        planet.curiosity.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Daruma',
                            color: DescriptionPlanet,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TitleComponent(title: 'Satélite(s)'),
                    Text(
                        planet.satellite
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        style: const TextStyle(
                            color: DescriptionPlanet,
                            fontSize: 20,
                            fontFamily: 'Daruma')),
                    const SizedBox(
                      height: 30,
                    ),
                    const TitleComponent(title: 'Galeria'),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: planet.photos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planet.photos[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
            )
          ]),
        ),
      ),
    ));
  }
}

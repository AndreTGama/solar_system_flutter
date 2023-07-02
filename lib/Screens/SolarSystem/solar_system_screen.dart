import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:solar_system_app/Components/Cards/card_comoponet.dart';
import 'package:solar_system_app/Components/background_main.dart';
import 'package:solar_system_app/Models/PlanetsModel.dart';
import 'package:flutter/services.dart' as rootBundle;

class SolarSystemScreen extends StatelessWidget {
  const SolarSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var planets = data.data as List<PlanetsModel>;
          var dataCards = planets.map((planet) {
            return Builder(
              builder: (BuildContext context) {
                return CardComoponet(planet: planet);
              },
            );
          }).toList();
          return BackgroundMain(
              child: CarouselSlider(
            options: CarouselOptions(
              height: 550,
              viewportFraction: 0.65,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: dataCards,
          ));
        } else {
          return const CircularProgressIndicator(
            value: 5,
            semanticsLabel: 'Circular progress indicator',
          );
        }
      },
    );
  }

  Future<List<PlanetsModel>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/planets.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => PlanetsModel.fromJson(e)).toList();
  }
}

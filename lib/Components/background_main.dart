import 'package:flutter/material.dart';

class BackgroundMain extends StatelessWidget {
  final Widget child;
  const BackgroundMain({
    Key? key,
    required this.child,
  }) : super(key: key);

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
            image: DecorationImage(
              image: AssetImage('assets/images/sistema-solar/space.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Sistema Solar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Daruma'
                  ),
                )
              ),
              Expanded(
                child: child
              ),
          ],)
        ),
      ),
    );
  }
}

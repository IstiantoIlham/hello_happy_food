import 'package:flutter/material.dart';
import 'package:hello_happy_food/screen/homepage.dart';
import 'package:hello_happy_food/utility/utils.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello Happy Food🥳',
              style: blueTitle.copyWith(fontSize: 24.0),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              child: Text(
                'Memasak makanan dengan\nperasaan senang',
                style: isi.copyWith(fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: const Text('Mari Menuju Resep!'))
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(2.0, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

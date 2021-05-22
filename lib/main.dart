import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Challenge {
  final String title;
  final Icon icon;
  final String description;
  final String scientist;
  final String sciPicture;

  Challenge(this.title, this.icon, this.description, this.scientist, this.sciPicture);
}


List<Challenge> challengeTree = [
  Challenge('Planes', Icon(Icons.local_airport), 'In this step, you will learn why airplanes fly. Make your own paper airplane following the instructions on the next step', 'physicist', 'phys.png'),
  Challenge('The Moon',Icon(Icons.nightlight), 'Learn about the mission target', 'physicist', 'phys.png'),
  Challenge('Stars', Icon(Icons.insights), 'The next target: the stars!', 'physicist', 'phys.png'),
  Challenge('Food', Icon(Icons.restaurant), 'Learn what to eat to stay healthy in space', 'physicist', 'phys.png'),
];

MaterialApp myApp = MaterialApp(
  title: 'To The Moon!',
  home: Challenges(
      challenges: challengeTree
  ),
);

void main() {
  runApp(myApp);
}

class Challenges extends StatelessWidget {
  final List<Challenge> challenges;

  Challenges({Key? key, required this.challenges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
      ),
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: challenges[index].icon,
            title: Text(challenges[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: challenges[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context)!.settings.arguments as Challenge;
    void navigateNext(challenge) {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
        // Pass the arguments as part of the RouteSettings. The
        // DetailScreen reads the arguments from these settings.
        settings: RouteSettings(
          arguments: challenge,
        ),
      ),
    );}
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('havaBilimcisi.png'),
          ),
            Text(challenge.description),
            ElevatedButton(onPressed: (){}, child: Text('Let\'s start!'))
          ]
        )
      ),
    );
  }
}
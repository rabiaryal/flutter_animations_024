import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(name: 'John', age: 20, emoji: '🤷‍♀️'),
  Person(name: 'Aayush', age: 21, emoji: '🧑🏿'),
  Person(name: 'Sagar', age: 22, emoji: '🧝🏿‍♀️'),
];

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
        backgroundColor: Colors.black.withRed(50),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text('${person.age} years Old '),
              leading: Hero(
                tag: person.emoji,
                child: Text(
                  person.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(person: person)));
              },
            );
          }),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Person person;

  const DetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withRed(10),
        title: Hero(
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                        scale: animation.drive(Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).chain(CurveTween(curve: Curves.fastOutSlowIn))),
                        child: toHeroContext.widget));
              case HeroFlightDirection.pop:
                return Material(
                    color: Colors.transparent, child: fromHeroContext.widget);
            }
          },
          tag: person.emoji,
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Hero(
              tag: person.name,
              child: Text(
                person.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${person.age}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

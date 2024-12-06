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
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text('${person.age} years Old '),
              leading: Text(
                person.emoji,
                style: const TextStyle(fontSize: 40),
              ),
            );
          }),
    );
  }
}

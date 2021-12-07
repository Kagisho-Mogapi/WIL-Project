import 'package:flutter/material.dart';

const users = [
  userGordon,
  userNash,
];

const userGordon = DemoUser(
  id: 'kai',
  name: 'King Kai',
  image:
      'https://pbs.twimg.com/profile_images/1262058845192335360/Ys_-zu6W_400x400.jpg',
);

const userNash = DemoUser(
  id: 'staff',
  name: 'Staff Member',
  image:
      'https://pbs.twimg.com/profile_images/1436372495381172225/4wDDMuD8_400x400.jpg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}

import 'package:flutter/material.dart';

const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = DemoUser(
  id: 'kai',
  name: 'King Kai',
  image:
      'https://pbs.twimg.com/profile_images/1262058845192335360/Ys_-zu6W_400x400.jpg',
);

const userSalvatore = DemoUser(
  id: 'edward',
  name: 'Edward Nell',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSacha = DemoUser(
  id: 'andiswa',
  name: 'Andiswa Ramolla',
  image:
      'https://pbs.twimg.com/profile_images/1199684106193375232/IxA9XLuN_400x400.jpg',
);

const userDeven = DemoUser(
  id: 'ndaba',
  name: 'Nqobile Ndaba',
  image:
      'https://pbs.twimg.com/profile_images/1371411357459832832/vIy8TO9F_400x400.jpg',
);

const userSahil = DemoUser(
  id: 'sahil',
  name: 'Lona Madolo',
  image:
      'https://pbs.twimg.com/profile_images/1324766105127153664/q96TpY8I_400x400.jpg',
);

const userReuben = DemoUser(
  id: 'thabo',
  name: 'Thabo Sefate',
  image:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
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

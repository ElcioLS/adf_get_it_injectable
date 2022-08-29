// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:injectable/injectable.dart';

@LazySingleton()
class RandomLazySingletonModel {
  int id;
  String name;

  RandomLazySingletonModel()
      : id = Random().nextInt(1000),
        name = 'RandomLazySingletonModel' {
    print('$name: id: $id');
  }
}

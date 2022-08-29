// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:injectable/injectable.dart';

@Singleton()
class RandomSingletonModel {
  int id;
  String name;

  RandomSingletonModel()
      : id = Random().nextInt(1000),
        name = 'RandomSingletonModel' {
    print('$name: id: $id');
  }
}

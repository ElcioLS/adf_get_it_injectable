import 'package:adf_get_it_injectable/app/core/service_locator.dart';
import 'package:adf_get_it_injectable/app/models/random_factory_model.dart';
import 'package:adf_get_it_injectable/app/models/random_lazy_singleton_model.dart';
import 'package:adf_get_it_injectable/app/models/random_singleton_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int id = 0;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$id'),
            Text(name),
            const Divider(),
            TextButton(
              onPressed: () {
                final instance = GetIt.I.get<RandomFactoryModel>();

                setState(() {
                  id = instance.id;
                  name = instance.name;
                });
              },
              child: const Text('Factory'),
            ),
            TextButton(
              onPressed: () {
                final instance = GetIt.I.get<RandomSingletonModel>();

                setState(() {
                  id = instance.id;
                  name = instance.name;
                });
              },
              child: const Text('Singleton'),
            ),
            TextButton(
              onPressed: () {
                final instance = GetIt.I.get<RandomLazySingletonModel>();

                setState(() {
                  id = instance.id;
                  name = instance.name;
                });
              },
              child: const Text('LazySingleton'),
            ),
          ],
        ),
      ),
    );
  }
}

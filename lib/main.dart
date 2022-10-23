import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:judhgf/api/api.dart';
import 'package:judhgf/test_mod/result.dart';
import 'package:judhgf/test_mod/test_mod.dart';

main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

//

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static TestMod? datas;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final data = await getAllData();
      if (data != null) {
        datas = data;
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: ResultNotifire,
        builder: (BuildContext context, List<Result>? value, child) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(
              value!.length,
              (index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original/${value[index].backdropPath}'),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

import '../../FirstScreen.dart';
//import '../home_widget/favourite.dart';
//import '../home_widget/season.dart';
import '../../profile/profile_page/profile_page.dart';
import '../home_widget/home_widget.dart.';

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;
  MyHomePage({ this.image,this.title,this.body,  super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => profilepage()));
        }, icon: Icon(Icons.account_box))
        ],
        centerTitle: true,
        title: Text("the ${title ?? "Tree"}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image == null || image!.isEmpty ?
            Image.asset("assets/tree2.jpg"): Image.file(height: 300,fit: BoxFit.cover,width: double.infinity,image![0]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                FavouriteWidget(),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    textAlign: TextAlign.justify, body ?? "Trees give us many benefits. Trees are the green cover of the planet. Trees need water, sunshine and air to grow. The process of photosynthesis that occurs in trees, that helps them grow, uses oxygen and gives out carbon-dioxide. Thus, they contribute to the oxygen in the air that we need to breathe to stay alive. They also use up the carbon-dioxide that is present in the air, and thus prevent the accumulation of the greenhouse gas that leads to global warming and climate change.")),

            image == null || image!.isEmpty ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MySeason(url: "assets/fall2.jpg", title: "fall"),
                MySeason(url: "assets/spring.jpg", title: "spring"),
              ],
            ) :
            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: image!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(
                    height: 100,
                    width: 200,
                    image![index],
                    fit: BoxFit.cover,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

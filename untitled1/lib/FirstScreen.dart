import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/main.dart';
import 'package:image_picker/image_picker.dart';

import 'home/home_screen/home_page.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

  class _FirstScreenState extends State<FirstScreen> {
    ImagePicker imagePicker = ImagePicker();

    List<File> ? selectedImage=[];

    Future<void> imageSelector(ImageSource  source) async{
      List <XFile>? images= await imagePicker.pickMultiImage();
      if(images!=null && mounted) {

        setState(() {
          //selectedImage = File(image!.path);
          selectedImage!.addAll( images.map((toElement)=>File(toElement!.path)).toList());
        });

      }
    }
    TextEditingController title = TextEditingController();
    TextEditingController body = TextEditingController();


    @override
    void dispose() {
      title.dispose();
      body.dispose();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/back.jpg"),
            )
          ),


          child: ListView(
            children: [
              SizedBox(height: 30,),
              selectedImage!.isEmpty ?
              Container(






               color:Colors.white38,
                height: 30,
                width: MediaQuery.sizeOf(context).width-20,


                child: IconButton(onPressed: (){
                  imageSelector (ImageSource.camera);


                }, icon: Icon(Icons.camera_alt)),)
                 :Row(
                   children: [ Container(






                     color:Colors.white38,
                     height: 100,
                     width: 100,


                     child: IconButton(onPressed: (){
                       imageSelector (ImageSource.camera);


                     }, icon: Icon(Icons.camera_alt)),),

                     SizedBox(height: 100,
                       width: MediaQuery.sizeOf(context).width-120,
                       child: ListView(
                                       scrollDirection: Axis.horizontal,
                                       children: selectedImage!.map((toElement)=>Stack(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                             child: Image.file(toElement,height: 100,width: 100,fit:BoxFit.cover),
                                           ),
                                           IconButton(onPressed: (){
                                             setState(() {
                                               selectedImage!.removeAt(selectedImage!.indexOf(toElement));

                                             });


                                           }, icon: Icon(Icons.cancel))

                                         ],
                                       )).toList(),),
                     ),
                   ],
                 ),



              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: title,

                      decoration: InputDecoration(
                          hintText: "title",
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: body,
                  minLines: 3,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: "body",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => MyHomePage(
              title: title.text,
              body: body.text,
                    image:selectedImage

            )
                )

            );
          },
        ),
      );
    }
  }





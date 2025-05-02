import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
// ···
class profilepage extends StatefulWidget {
   profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  ImagePicker imagePicker = ImagePicker();

  File ? selectedImage;

   Future<void> imageSelector(ImageSource  source) async{
   XFile? image= await imagePicker.pickImage(source: source);
if(image!=null && mounted) {

  setState(() {
    selectedImage = File(image!.path);
  });

}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),

      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 100,
                  child:
                  selectedImage==null?



                  Icon(
                      Icons.person,
                      size: 200,
                      color: Colors.white38
                  )
                     :ClipOval(child: Image.file(
                      fit: BoxFit.cover,
                      selectedImage!))),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Text("profile",style: TextStyle(fontSize: 25),),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      options(
                                        onpressed: (){

                                          imageSelector(ImageSource.camera);
                                        }


                                        ,
                                        title: "camera",icon: Icons.camera_alt,),
                                      options(
                                        onpressed: (){
                                          imageSelector(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        title: "Gallery",icon: Icons.image,),
                                      if(selectedImage!=null)
                                        options( selectedImage: selectedImage,
                                        onpressed: (){
                                          if(mounted) {
                                            setState(() {
                                              selectedImage = null;
                                            });
                                          }

                                        },
                                        title: "delete",icon: Icons.delete,),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                    icon: Icon(color: Colors.grey, Icons.camera_alt, size: 35),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class options extends StatelessWidget{
  final String title;
  final IconData icon;
  Colors? color;
  File ? selectedImage;
  VoidCallback onpressed;


   options({
     this.selectedImage,
     required this.onpressed
     ,this.color,required
     this.title,
     required this.icon,
     super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage==null? Colors.grey : Colors.red,
          icon: Icon(
              icon,
          ),
          onPressed:onpressed,

        ),
        Text(title),
      ],
    );

  }

}
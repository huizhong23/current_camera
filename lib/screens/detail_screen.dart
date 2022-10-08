import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_http_get_request/models/user_model.dart';
import 'package:flutter_riverpod_http_get_request/screens/camera_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../services/image_picker_service.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.e}) : super(key: key);
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(e.avatar),
                  ),
                ),
                Text(e.firstname + " " + e.lastname),
                Text(e.email),
              ],
            )),
      ),
      floatingActionButton: Consumer(builder: (context, ref, child) {
        final imagePickerService = ref.watch(imagePickerServiceProvider);
        return FloatingActionButton(
          onPressed: () {
            /*  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            ).then((value) {
              final imagePickerService = ref.watch(imagePickerServiceProvider);
              imagePickerService.imagePath = null;
            }); */
            imagePickerService.takeCamera();
          },
          //tooltip: 'Camera',
          child: const Icon(Icons.camera),
        );
      }),
    );
  }
}

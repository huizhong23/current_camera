import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerServiceProvider =
    ChangeNotifierProvider<ImagePickerService>((ref) {
  return ImagePickerService();
});

class ImagePickerService extends ChangeNotifier {
  final _picker = ImagePicker();
  File? imagePath;

  ImagePickerService() {
    disposeOldImage();
  }

  void disposeOldImage() async {
    imagePath = null;
    notifyListeners();
  }

  @override
  void dispose() {
    disposeOldImage();
    super.dispose();
  }

  Future<void> takeCamera() async {
    final pickedfile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickedfile != null) {
      imagePath = File(pickedfile.path);
    }
    notifyListeners();
  }

  Future<void> takeGallery() async {
    final pickedfile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedfile != null) {
      imagePath = File(pickedfile.path);
    }
    notifyListeners();
  }
}

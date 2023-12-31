import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    final selectedImage = File(pickedImage.path);
    widget.onPickImage(selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: _takePicture, // Appeler la fonction pour prendre une photo
        child: Icon(
          Icons.camera,
          size: 80,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

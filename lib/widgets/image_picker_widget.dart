import 'dart:io';
import 'package:contact_app/widgets/picker_options.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ImagePickerWidget extends StatefulWidget {
  final void Function(String?) imagePicked;

  const ImagePickerWidget({
    super.key,
    required this.imagePicked,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? imagePicked;
  final picker = ImagePicker();

  pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePicked = File(pickedFile.path);
      });
      widget.imagePicked(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color(0xff29384D),
          context: context,
          builder: (context) {
            return PickerOptions(
              optionSelected: (source) => pickImage(source),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xffFFF1D4)),
        ),
        height: height * 0.16,
        width: width * 0.35,
        child: imagePicked != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.file(imagePicked!, fit: BoxFit.cover),
              )
            : Lottie.asset(
                'assets/animations/image_picker.json',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

import 'package:contact_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerOptions extends StatelessWidget {
  final void Function(ImageSource source) optionSelected;

  const PickerOptions({
    super.key,
    required this.optionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.photo_library, color: Color(0xffFFF1D4)),
          title:
              Text('Gallery', style: AppTheme.mainTheme.textTheme.titleMedium),
          onTap: () {
            Navigator.of(context).pop();
            optionSelected(ImageSource.gallery);
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt, color: Color(0xffFFF1D4)),
          title:
              Text('Camera', style: AppTheme.mainTheme.textTheme.titleMedium),
          onTap: () {
            Navigator.of(context).pop();
            optionSelected(ImageSource.camera);
          },
        ),
      ],
    );
  }
}

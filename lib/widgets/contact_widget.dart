import 'dart:io';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key, required this.contact, required this.delete});
  final ContactModel contact;
  final VoidCallback delete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    image: (contact.imagePath != null &&
                            contact.imagePath!.isNotEmpty)
                        ? DecorationImage(
                            image: FileImage(File(contact.imagePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: (contact.imagePath == null ||
                            contact.imagePath!.isEmpty)
                        ? Colors.grey[300]
                        : null,
                  ),
                  child:
                      (contact.imagePath == null || contact.imagePath!.isEmpty)
                          ? const Center(
                              child: Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.grey,
                              ),
                            )
                          : null,
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF1D4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.name,
                      style: const TextStyle(
                        color: Color(0xff29384D),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffFFF1D4),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.email_rounded,
                        color: Color(0xff29384D),
                      ),
                    ),
                    Text(
                      contact.email,
                      style: AppTheme.mainTheme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.phone_in_talk_rounded,
                        color: Color(0xff29384D),
                      ),
                    ),
                    Text(
                      contact.phone,
                      style: AppTheme.mainTheme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: delete,
                      icon: const Icon(
                        Icons.delete,
                        color: Color(0xffFFF1D4),
                        size: 18,
                      ),
                      label: const Text(
                        "Delete",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xffFFF1D4)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffEE403D),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

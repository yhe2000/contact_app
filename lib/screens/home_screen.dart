import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/theme/app_theme.dart';
import 'package:contact_app/widgets/contact_widget.dart';
import 'package:contact_app/widgets/custom_app_bar.dart';
import 'package:contact_app/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: contacts.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animations/empty_list.json'),
                    Text(
                      'There is No Contacts Added Here',
                      style: AppTheme.mainTheme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.63,
                      ),
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return ContactWidget(
                          contact: contacts[index],
                          delete: () {
                            setState(() {
                              contacts.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              backgroundColor: Colors.red,
              foregroundColor: const Color(0xffFFF1D4),
              onPressed: () {
                {
                  if (contacts.isNotEmpty) {
                    setState(() {
                      contacts.removeLast();
                    });
                  }
                }
              },
              child: const Icon(Icons.delete),
            ),
          const SizedBox(height: 8),
          if (contacts.length < 6)
            FloatingActionButton(
              backgroundColor: const Color(0xffFFF1D4),
              foregroundColor: const Color(0xff29384D),
              onPressed: () async {
                final result = await showModalBottomSheet<ContactModel>(
                  isScrollControlled: true,
                  backgroundColor: const Color(0xff29384D),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: const CustomBottomSheet(),
                    );
                  },
                );

                if (result != null) {
                  setState(() {
                    contacts.add(result);
                  });
                }
              },
              child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}

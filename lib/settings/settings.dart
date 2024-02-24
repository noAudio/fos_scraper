import 'package:flutter/material.dart';
import 'package:fos_scraper/common/screen.dart';
import 'package:fos_scraper/settings/section.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen(
      heading: 'Settings',
      child: Column(
        children: [
          Section(
            title: 'Files',
            children: [
              fl.Divider(),
              Text(
                'Choose download locations and manage data.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:fos_scraper/common/screen.dart';
import 'package:fos_scraper/home/components/search_options.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen(
      child: SearchOptions(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;

class ScrapeStatus extends StatelessWidget {
  const ScrapeStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 25, height: 25, child: fl.ProgressRing(value: null,),),
              SizedBox(width: 5),
              fl.Text('Scraping data...'),
            ],
          ),
        ],
      ),
    );
  }
}

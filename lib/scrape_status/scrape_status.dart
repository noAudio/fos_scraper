import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/models/app_state.dart';

class ScrapeStatus extends StatelessWidget {
  const ScrapeStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          AppState state = store.state;
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 25,
                      height: 25,
                      child: fl.ProgressRing(
                        value: null,
                      ),
                    ),
                    const SizedBox(width: 5),
                    fl.Text(state.infoMessage),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

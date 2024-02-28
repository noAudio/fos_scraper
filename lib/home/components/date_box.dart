import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/actions/set_end_date_action.dart';
import 'package:fos_scraper/actions/set_start_date_action.dart';
import 'package:fos_scraper/models/app_state.dart';

class DateBox extends StatelessWidget {
  const DateBox({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
      converter: (store) => store,
      builder: (context, store) {
        AppState state = store.state;

        void onChanged(DateTime time) {
          if (label == 'Date from') {
            store.dispatch(SetStartDateAction(startDate: time));
          } else {
            store.dispatch(SetEndDateAction(endDate: time));
          }
        }

        return fl.DatePicker(
          header: label,
          selected: label == 'Date from' ? state.startDate : state.endDate,
          onChanged: state.isSearching
              ? null
              : (time) {
                  onChanged(time);
                },
        );
      },
    );
  }
}

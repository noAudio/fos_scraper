import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/actions/index.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';
import 'package:fos_scraper/models/app_state.dart';

class Option extends StatefulWidget {
  final String label;
  final dynamic type;
  const Option({
    super.key,
    required this.label,
    required this.type,
  });

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          AppState state = store.state;

          void onClick() {
            if (isChecked!) {
              if (widget.type is WithinOptionsEnum) {
                store.dispatch(
                    AddWithinOptionsAction(withinOption: widget.type));
              } else {
                store.dispatch(AddDecisionsAction(decision: widget.type));
              }
            } else {
              if (widget.type is WithinOptionsEnum) {
                store.dispatch(
                    RemoveWithinOptionsAction(withinOption: widget.type));
              } else {
                store.dispatch(RemoveDecisionsAction(decision: widget.type));
              }
            }
          }

          return fl.Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
            child: fl.InfoLabel(
              label: widget.label,
              isHeader: false,
              child: fl.Checkbox(
                checked: isChecked,
                onChanged: state.isSearching
                    ? null
                    : (value) {
                        setState(() => isChecked = value);
                        onClick();
                      },
              ),
            ),
          );
        });
  }
}

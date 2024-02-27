import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/actions/set_business_name_action.dart';
import 'package:fos_scraper/actions/set_key_word_action.dart';
import 'package:fos_scraper/models/app_state.dart';

class TextBox extends fl.StatelessWidget {
  const TextBox({
    super.key,
    required this.label,
  });

  final String label;

  @override
  fl.Widget build(fl.BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          // Update state as user types
          void onUpdate(String textInput) {
            if (label == 'Keyword or Product') {
              store.dispatch(SetKeyWordAction(keyWord: textInput));
            } else {
              store.dispatch(SetBusinessNameAction(businessName: textInput));
            }
          }

          return fl.InfoLabel(
            label: label,
            child: fl.SizedBox(
              width: 250,
              child: fl.TextBox(
                autofocus: true,
                onChanged: (value) => onUpdate(value),
              ),
            ),
          );
        });
  }
}

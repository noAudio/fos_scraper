import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/actions/set_search_action.dart';
import 'package:fos_scraper/models/app_state.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  String linkBuilder(AppState state) {
    // TODO: Build link
    // example link: https://www.financial-ombudsman.org.uk/decisions-case-studies/ombudsman-decisions/search?Keyword=estate&BusinessName=house&Business=house&IndustrySectorID%5B1%5D=1&IndustrySectorID%5B2%5D=2&IndustrySectorID%5B3%5D=3&IndustrySectorID%5B4%5D=4&IndustrySectorID%5B5%5D=5&IndustrySectorID%5B6%5D=6&DateFrom=2020-02-27&DateTo=2024-02-27&IsUpheld%5B1%5D=1&IsUpheld%5B0%5D=0&Sort=relevance
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
      converter: (store) => store,
      builder: (context, store) {
        AppState state = store.state;

        return fl.FilledButton(
          onPressed: state.isSearching
              ? null
              : () {
                  String link = linkBuilder(state);
                  print(link);
                  store.dispatch(SetSearchAction(isSearching: true));
                },
          child: fl.Text(state.isSearching ? 'Searching...' : 'Search'),
        );
      },
    );
  }
}

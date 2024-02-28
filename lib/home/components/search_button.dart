import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/actions/set_search_action.dart';
import 'package:fos_scraper/enums/decisions_enum.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';
import 'package:fos_scraper/logic/scraper/scraper.dart';
import 'package:fos_scraper/models/app_state.dart';
import 'package:intl/intl.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  String linkBuilder(AppState state) {
    // TODO: Build link
    // example link: https://www.financial-ombudsman.org.uk/decisions-case-studies/ombudsman-decisions/search?Keyword=estate&BusinessName=house&Business=house&IndustrySectorID%5B1%5D=1&IndustrySectorID%5B2%5D=2&IndustrySectorID%5B3%5D=3&IndustrySectorID%5B4%5D=4&IndustrySectorID%5B5%5D=5&IndustrySectorID%5B6%5D=6&DateFrom=2020-02-27&DateTo=2024-02-27&IsUpheld%5B1%5D=1&IsUpheld%5B0%5D=0&Sort=relevance
    String keyWord = state.keyWord == '' ? '' : 'Keyword=${state.keyWord}&';
    String businessName = state.businessName == ''
        ? ''
        : 'BusinessName=${state.businessName}&Business=${state.businessName}&';
    String withinOptions = '';
    if (state.withinOptions.isNotEmpty) {
      for (var option in state.withinOptions) {
        int value = option == WithinOptionsEnum.bankingCreditMortgages
            ? 1
            : option == WithinOptionsEnum.investmentPensions
                ? 2
                : option == WithinOptionsEnum.insuranceExcludingPPI
                    ? 3
                    : option == WithinOptionsEnum.paymentProtectionInsurance
                        ? 4
                        : option ==
                                WithinOptionsEnum
                                    .claimsManagementOmbudsmanDecisions
                            ? 5
                            : option == WithinOptionsEnum.funeralPlans
                                ? 6
                                : 0;
        if (value != 0) {
          withinOptions =
              '${withinOptions}IndustrySectorID%5B$value%5D=$value&';
        }
      }
    }
    // TODO: Format dates properly
    // TODO: Check how giving only a start date changes the link
    String startDate = state.startDate != null
        ? 'DateFrom=${DateFormat('yyyy-MM-dd').format(state.startDate!)}&'
        : '';
    String endDate = state.endDate != null
        ? 'DateTo=${DateFormat('yyyy-MM-dd').format(state.endDate!)}&'
        : '';
    String decisions = '';
    if (state.decisions.isNotEmpty) {
      for (var decision in state.decisions) {
        var value = decision == DecisionsEnum.notUpheld
            ? 0
            : decision == DecisionsEnum.upheld
                ? 1
                : -1;
        if (value != -1) {
          decisions = '${decisions}IsUpheld%5B$value%5D=$value&';
        }
      }
    }
    // TODO: Sort by date
    return 'https://www.financial-ombudsman.org.uk/decisions-case-studies/ombudsman-decisions/search?$keyWord$businessName$withinOptions$startDate$endDate${decisions}Sort=date';
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
                  store.dispatch(SetSearchAction(isSearching: true));
                  var scraper = Scraper(link: link);
                  scraper.getData();
                  store.dispatch(SetSearchAction(isSearching: false));
                },
          child: fl.Text(state.isSearching ? 'Searching...' : 'Search'),
        );
      },
    );
  }
}

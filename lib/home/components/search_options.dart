import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/actions/index.dart';
import 'package:fos_scraper/enums/decisions_enum.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';
import 'package:fos_scraper/home/components/option.dart';
import 'package:fos_scraper/models/app_state.dart';
import 'package:fos_scraper/scrape_status/scrape_status.dart';
import 'package:fos_scraper/home/components/text_box.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          AppState state = store.state;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    TextBox(label: 'Keyword or Product'),
                    SizedBox(
                      width: 25,
                    ),
                    TextBox(label: 'Business name'),
                  ],
                ),
              ),
              // within
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fl.InfoLabel(label: 'Within'),
                    const Option(
                      label: 'Banking, credit and mortgages',
                      type: WithinOptionsEnum.bankingCreditMortgages,
                    ),
                    const Option(
                      label: 'Investment and pensions',
                      type: WithinOptionsEnum.investmentPensions,
                    ),
                    const Option(
                      label: 'Insurance (excluding PPI)',
                      type: WithinOptionsEnum.insuranceExcludingPPI,
                    ),
                    const Option(
                      label: 'Payment protection insurance (PPI)',
                      type: WithinOptionsEnum.paymentProtectionInsurance,
                    ),
                    const Option(
                      label: 'Claims Management Ombudsman decisions',
                      type:
                          WithinOptionsEnum.claimsManagementOmbudsmanDecisions,
                    ),
                    const Option(
                      label: 'Funeral plans',
                      type: WithinOptionsEnum.funeralPlans,
                    ),
                  ],
                ),
              ),
              // date range
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    // TODO: Make sure pickers are disabled while searching
                    fl.DatePicker(
                      header: 'Date from',
                      selected: state.startDate,
                      onChanged: state.isSearching
                          ? null
                          : (time) {
                              store.dispatch(
                                  SetStartDateAction(startDate: time));
                            },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    fl.DatePicker(
                      header: 'Date to',
                      selected: state.endDate,
                      onChanged: state.isSearching
                          ? null
                          : (time) {
                              store.dispatch(SetEndDateAction(endDate: time));
                            },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fl.InfoLabel(label: 'Decisions that were'),
                    const Option(
                      label: 'Upheld',
                      type: DecisionsEnum.upheld,
                    ),
                    const Option(
                      label: 'Not upheld',
                      type: DecisionsEnum.notUpheld,
                    ),
                  ],
                ),
              ),
              // TODO: Split into seperate file then build out logic for link building and call scraping function
              fl.FilledButton(
                onPressed: state.isSearching
                    ? null
                    : () {
                        store.dispatch(SetSearchAction(isSearching: true));
                      },
                child: fl.Text(state.isSearching ? 'Searching...' : 'Search'),
              ),
              state.isSearching ? const ScrapeStatus() : const SizedBox(),
            ],
          );
        });
  }
}

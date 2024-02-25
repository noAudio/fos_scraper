import 'package:fos_scraper/enums/decisions_enum.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';

class AppState {
  final String keyWord;
  final String businessName;
  final List<WithinOptionsEnum> withinOptions;
  final DateTime startDate;
  final DateTime endDate;
  final List<Decisions> decisions;
  final bool isSearching;
  final String inputErrorMessage;
  final String logicErrorMessage;

  AppState({
    required this.keyWord,
    required this.businessName,
    required this.withinOptions,
    required this.startDate,
    required this.endDate,
    required this.decisions,
    required this.isSearching,
    required this.inputErrorMessage,
    required this.logicErrorMessage,
  });

  factory AppState.initial() => AppState(
        keyWord: '',
        businessName: '',
        withinOptions: [],
        startDate: DateTime.now().subtract(const Duration(days: 365)),
        endDate: DateTime.now(),
        decisions: [],
        isSearching: false,
        inputErrorMessage: '',
        logicErrorMessage: '',
      );
}

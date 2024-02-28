import 'package:fos_scraper/enums/decisions_enum.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';

class AppState {
  final String keyWord;
  final String businessName;
  final List<WithinOptionsEnum> withinOptions;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<DecisionsEnum> decisions;
  final bool isSearching;
  final String inputErrorMessage;
  final String logicErrorMessage;
  final String infoMessage;

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
    required this.infoMessage,
  });

  AppState copyWith(
      {String? keyWord,
      String? businessName,
      List<WithinOptionsEnum>? withinOptions,
      DateTime? startDate,
      DateTime? endDate,
      List<DecisionsEnum>? decisions,
      bool? isSearching,
      String? inputErrorMessage,
      String? logicErrorMessage,
      String? infoMessage}) {
    return AppState(
      keyWord: keyWord ?? this.keyWord,
      businessName: businessName ?? this.businessName,
      withinOptions: withinOptions ?? this.withinOptions,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      decisions: decisions ?? this.decisions,
      isSearching: isSearching ?? this.isSearching,
      inputErrorMessage: inputErrorMessage ?? this.inputErrorMessage,
      logicErrorMessage: logicErrorMessage ?? this.logicErrorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
    );
  }

  factory AppState.initial() => AppState(
        keyWord: '',
        businessName: '',
        withinOptions: [],
        startDate: null,
        endDate: null,
        decisions: [],
        isSearching: false,
        inputErrorMessage: '',
        logicErrorMessage: '',
        infoMessage: '',
      );
}

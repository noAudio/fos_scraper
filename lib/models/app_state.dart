import 'package:fos_scraper/enums/decisions_enum.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';

class AppState {
  final String keyWord;
  final String businessName;
  final List<WithinOptionsEnum> withinOptions;
  final DateTime startDate;
  final DateTime endDate;
  final List<DecisionsEnum> decisions;
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

  AppState copyWith({
    String? keyWord,
    String? businessName,
    List<WithinOptionsEnum>? withinOptions,
    DateTime? startDate,
    DateTime? endDate,
    List<DecisionsEnum>? decisions,
    bool? isSearching,
    String? inputErrorMessage,
    String? logicErrorMessage,
  }) {
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
    );
  }

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

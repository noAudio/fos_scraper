class AppState {
  final String keyWord;
  final String businessName;
  final List<String> withinOptions;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> decisions;
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

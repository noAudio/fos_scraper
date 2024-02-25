import 'package:fos_scraper/actions/index.dart';
import 'package:fos_scraper/actions/remove_decisions_action.dart';
import 'package:fos_scraper/enums/within_options_enum.dart';
import 'package:fos_scraper/models/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetKeyWordAction) {
    return state.copyWith(keyWord: action.keyWord);
  } else if (action is SetBusinessNameAction) {
    return state.copyWith(businessName: action.businessName);
  } else if (action is AddWithinOptionsAction) {
    return state
        .copyWith(withinOptions: [...state.withinOptions, action.withinOption]);
    // TODO: create RemoveWithinOptionsAction
  } else if (action is SetDateRangeAction) {
    return state.copyWith(startDate: action.startDate, endDate: action.endDate);
  } else if (action is AddDecisionsAction) {
    return state.copyWith(decisions: [...state.decisions, action.decision]);
  } else if (action is RemoveDecisionsAction) {
    var decisionsList = state.decisions;
    decisionsList.remove(action.decision);
    return state.copyWith(decisions: decisionsList);
  } else if (action is SetSearchAction) {
    return state.copyWith(isSearching: action.isSearching);
  } else if (action is SetInputErrorMessageAction) {
    return state.copyWith(inputErrorMessage: action.inputErrorMessage);
  } else if (action is SetLogicErrorMessageAction) {
    return state.copyWith(logicErrorMessage: action.logicErrorMessage);
  }
  return state;
}

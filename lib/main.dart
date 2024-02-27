import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fos_scraper/home/home.dart';
import 'package:fos_scraper/models/app_state.dart';
import 'package:fos_scraper/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(appReducer, initialState: AppState.initial());
  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Scraper',
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        accentColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationView(
      content: Home(),
    );
  }
}

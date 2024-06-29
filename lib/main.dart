import 'package:devpanel/app/app.bottomsheets.dart';
import 'package:devpanel/app/app.dialogs.dart';
import 'package:devpanel/app/app.locator.dart';
import 'package:devpanel/app/app.router.dart';
import 'package:devpanel/ui/config/commons.dart';
import 'package:devpanel/ui/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupCommons();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}

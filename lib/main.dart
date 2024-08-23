import 'package:devpanel/app/app.bottomsheets.dart';
import 'package:devpanel/app/app.dialogs.dart';
import 'package:devpanel/app/app.locator.dart';
import 'package:devpanel/app/app.router.dart';
import 'package:devpanel/config/navigation_stack_observer.dart';
import 'package:devpanel/ui/config/commons.dart';
import 'package:devpanel/ui/config/setup.dart';
import 'package:devpanel/ui/config/theme.dart';
import 'package:devpanel/ui/widget/show_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await setupConfigLocator();
  setupCommons();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ShowScrollbar(),
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
          NavigationStackObserver(),
        ],
      ),
    );
  }
}

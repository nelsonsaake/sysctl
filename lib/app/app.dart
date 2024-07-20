import 'package:devpanel/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:devpanel/ui/dialogs/create_sh/create_sh_dialog.dart';
import 'package:devpanel/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:devpanel/ui/views/dynos/dynos_view.dart';
import 'package:devpanel/ui/views/home/home_view.dart';
import 'package:devpanel/ui/views/run/run_view.dart';
import 'package:devpanel/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: DynosView),
    MaterialRoute(page: RunView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: CreateSHDialog),
    // @stacked-dialog
  ],
)
class App {}

import 'package:devpanel/app/app.router.dart';
import 'package:devpanel/ui/viewmodels/context_viewmodel.dart';

class HomeViewModel extends ContextViewModel {
  //...

  final routes = {
    "Dynos": Routes.dynosView,
    "Makefiles": Routes.makefilesView,
  };

  Future init() async {}
}

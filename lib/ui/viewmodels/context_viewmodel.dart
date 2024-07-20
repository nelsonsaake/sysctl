import 'package:devpanel/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

NavigationService get nav => locator<NavigationService>();

class ContextViewModel extends BaseViewModel {
  //...

  NavigationService get nav => locator<NavigationService>();
}

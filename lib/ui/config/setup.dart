import 'package:devpanel/objectbox.g.dart';
import 'package:get_it/get_it.dart';

final configLocator = GetIt.instance;

setupConfigLocator() async {
  configLocator.registerSingletonAsync<Store>(openStore);
}

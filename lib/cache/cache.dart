import 'package:devpanel/objectbox.g.dart';
import 'package:devpanel/ui/config/setup.dart';

import 'commands.dart';

class Cache {
  //...

  static Store get _store => configLocator<Store>();

  static Box<Commands> get navigationStack => _store.box<Commands>();
}

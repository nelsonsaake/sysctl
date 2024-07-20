import 'package:devpanel/objectbox.g.dart';
import 'package:devpanel/ui/config/setup.dart';

import 'sh.dart';

class Cache {
  //...

  static Store get _store => configLocator<Store>();

  static Box<SH> get shDB => _store.box<SH>();
}

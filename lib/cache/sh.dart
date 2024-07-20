import 'package:objectbox/objectbox.dart';

// part 'navigation_stack.g.dart';

@Entity()
class SH {
  //...

  @Id()
  int id = 0;

  final String? name;

  final String? path;

  final String? command;

  SH({this.name, this.path, this.command});
}

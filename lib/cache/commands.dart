import 'package:objectbox/objectbox.dart';

// part 'navigation_stack.g.dart';

@Entity()
class Commands {
  //...

  @Id()
  int id = 0;

  final String path;

  final List<String> commands;

  Commands({required this.path, this.commands = const []});
}

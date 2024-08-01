import 'package:commons/helpers/str.dart';
import 'package:devpanel/dynos/dyno.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class SH {
  //...

  @Id()
  int id = 0;

  final String name;

  final String workingDirectory;

  final String exec;

  SH({required this.name, required this.workingDirectory, required this.exec});

  Dyno toDyno() => Dyno(
        id: id,
        name: str(name),
        workingDirectory: str(workingDirectory),
        exec: str(exec),
      );
}

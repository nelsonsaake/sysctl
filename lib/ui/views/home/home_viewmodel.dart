import 'package:devpanel/dynos/dyno.dart';
import 'package:devpanel/dynos/loadDynos.dart';
import 'package:devpanel/ui/viewmodels/context_viewmodel.dart';

class HomeViewModel extends ContextViewmodel {
  //...

  List<Dyno>? _dynos;

  List<Dyno> get dynos => _dynos ?? [];

  Dyno? _selectedDyno;

  Dyno? get selectedDyno => _selectedDyno;

  void selectDyno(Dyno v) {
    _selectedDyno = v;
    notifyListeners();
  }

  bool isDynoSelected(Dyno v) => _selectedDyno == v;

  Future init() async {
    _dynos = await runBusyFuture(loadDynos());
    if (dynos.isNotEmpty) selectDyno(dynos[0]);
  }
}

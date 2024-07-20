import 'dart:async';

import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/dynos/load_dynos.dart';
import 'package:devpanel/viewmodels/context_viewmodel.dart';

class DynosViewModel extends ContextViewModel {
  //...

  List<DynoRunner>? _dynoRunners;

  List<DynoRunner> get dynoRunners => _dynoRunners ?? [];

  DynoRunner? _selectedDynoRunner;

  DynoRunner? get selectedDynoRunner => _selectedDynoRunner;

  StreamSubscription? _sub;

  void listenToRunner() {
    _sub?.cancel();
    _sub = _selectedDynoRunner?.changeStream.listen((_) => notifyListeners());
  }

  void selectDynoRunner(DynoRunner v) {
    _selectedDynoRunner = v;
    notifyListeners();
  }

  dynoRunnerStart(DynoRunner runner) async {
    await runBusyFuture(runner.start(), busyObject: runner);
  }

  void dynoRunnerStop(DynoRunner runner) {
    runBusyFuture(runner.stop(), busyObject: runner);
  }

  void dynoRunnerRestart(DynoRunner runner) {
    runBusyFuture(runner.restart(), busyObject: runner);
  }

  void dynoRunnerClearLogs(DynoRunner runner) {
    runner.clearLogs();
    notifyListeners();
  }

  bool isDynoRunnerSelected(DynoRunner v) => _selectedDynoRunner == v;

  DynoRunner makeRunner(dyno) {
    final runner = DynoRunner(dyno: dyno);
    runner.changeStream.listen((_) => notifyListeners());
    return runner;
  }

  Future init() async {
    final dynos = await runBusyFuture(loadDynos());
    _dynoRunners = dynos.map(makeRunner).toList();
    if (dynoRunners.isNotEmpty) selectDynoRunner(dynoRunners[0]);
  }

  @override
  void dispose() {
    for (var runner in dynoRunners) {
      runner.stop();
    }
    super.dispose();
  }
}

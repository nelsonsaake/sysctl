import 'dart:async';

import 'package:devpanel/app/app.dialogs.dart';
import 'package:devpanel/cache/cache.dart';
import 'package:devpanel/cache/sh.dart';
import 'package:devpanel/dynos/dyno.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/dynos/load_dyno_files.dart';
import 'package:devpanel/viewmodels/context_viewmodel.dart';
import 'package:flutter/material.dart';

class DynosViewModel extends ContextViewModel {
  //...

  final scrollController = ScrollController();

  double _fontSize = 10.5;

  double get fontSize => _fontSize;

  List<DynoRunner>? _dynoRunners;

  List<DynoRunner> get dynoRunners => _dynoRunners ?? [];

  DynoRunner? _selectedDynoRunner;

  DynoRunner? get selectedDynoRunner => _selectedDynoRunner;

  String? get out => _selectedDynoRunner?.out;

  StreamSubscription? _sub;

  bool isDynoRunnerSelected(DynoRunner v) => _selectedDynoRunner == v;

  Future<List<Dyno>> loadDynosFromDB() async {
    final ls = Cache.sh.getAll();
    return ls.map((sh) => sh.toDyno()).toList();
  }

  listenToRunner() {
    _sub?.cancel();
    _sub = _selectedDynoRunner?.changeStream.listen((_) => notifyListeners());
  }

  selectDynoRunner(DynoRunner v) {
    _selectedDynoRunner = v;
    notifyListeners();
  }

  dynoRunnerStart(DynoRunner runner) {
    selectDynoRunner(runner);
    runBusyFuture(runner.start(), busyObject: runner);
  }

  dynoRunnerStop(DynoRunner runner) {
    selectDynoRunner(runner);
    runBusyFuture(runner.stop(), busyObject: runner);
  }

  dynoRunnerRestart(DynoRunner runner) {
    selectDynoRunner(runner);
    runBusyFuture(runner.restart(), busyObject: runner);
  }

  dynoRunnerClearLogs(DynoRunner runner) {
    runner.clearLogs();
    notifyListeners();
  }

  scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  showCreateSHDialog() async {
    final resp = await dialogs.showCustomDialog(
      variant: DialogType.createSH,
      barrierDismissible: true,
    );
    if (resp?.data is SH) {
      dynoRunners.add(makeRunner(resp?.data.toDyno()));
      notifyListeners();
      scrollToEnd();
    }
  }

  _deleteDyno(Dyno dyno) async {
    final id = dyno.id ?? 0;
    if (id != 0) {
      await Cache.sh.removeAsync(id);
      dynoRunners.removeWhere((runner) => runner.dyno.id == id);
    }
  }

  deleteDyno(Dyno dyno) async {
    return runBusyFuture(_deleteDyno(dyno));
  }

  decrementFontSize() {
    _fontSize -= .5;
    notifyListeners();
  }

  incrementFontSize() {
    _fontSize += .5;
    notifyListeners();
  }

  DynoRunner makeRunner(dyno) {
    final runner = DynoRunner(dyno: dyno);
    runner.changeStream.listen((_) => notifyListeners());
    return runner;
  }

  Future init() async {
    final dynoGroups = await runBusyFuture(
      Future.wait([
        loadDynosFromDB(),
        loadDynoFiles(),
      ]),
    );
    final dynos = dynoGroups.reduce((ls1, ls2) => [...ls1, ...ls2]);
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

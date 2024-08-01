import 'package:devpanel/cache/cache.dart';
import 'package:devpanel/cache/sh.dart';
import 'package:devpanel/viewmodels/context_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateShDialogModel extends ContextViewModel {
  //...
  final DialogRequest request;
  final Function(DialogResponse) completer;

  CreateShDialogModel(this.request, this.completer);

  final name = TextEditingController();
  final workingDirectory = TextEditingController();
  final exec = TextEditingController();

  Future<SH> createSH() {
    return Cache.sh.putAndGetAsync(SH(
      name: name.text,
      workingDirectory: workingDirectory.text,
      exec: exec.text,
    ));
  }

  cancel() {
    completer(DialogResponse(confirmed: false));
  }

  submit() async {
    final sh = await runBusyFuture(createSH());
    completer(DialogResponse(confirmed: true, data: sh));
  }
}

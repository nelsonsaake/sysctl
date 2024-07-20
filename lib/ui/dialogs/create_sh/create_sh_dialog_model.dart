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

  void createSH() {
    print((
      name.text,
      workingDirectory.text,
      exec.text,
    ));
  }

  void cancel() {
    completer(DialogResponse(confirmed: false));
  }

  void submit() {
    createSH();
    completer(DialogResponse(confirmed: true));
  }
}

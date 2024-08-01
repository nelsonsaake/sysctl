import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/dynos/dynos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

class DeleteButton extends ViewModelWidget<DynosViewModel> {
  const DeleteButton({
    super.key,
    required this.runner,
  });

  final DynoRunner runner;

  @override
  Widget build(BuildContext context, DynosViewModel viewModel) {
    return IconButton(
      icon: Icon(
        TablerIcons.trash,
        color: runner.isActive ? kcRed600 : kcNeutral600,
      ),
      onPressed: () => viewModel.deleteDyno(runner.dyno),
    );
  }
}

import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/makefiles/makefiles_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

class StartButton extends ViewModelWidget<MakefilesViewModel> {
  const StartButton({
    super.key,
    required this.runner,
  });

  final DynoRunner runner;

  @override
  Widget build(BuildContext context, MakefilesViewModel viewModel) {
    return IconButton(
      icon: Icon(
        TablerIcons.player_play,
        color: runner.isActive ? kcGreen600 : kcStone500,
      ),
      onPressed: () => viewModel.dynoRunnerStart(runner),
    );
  }
}

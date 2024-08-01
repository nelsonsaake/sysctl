import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/dynos/dynos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

class RestartButton extends ViewModelWidget<DynosViewModel> {
  const RestartButton({
    super.key,
    required this.runner,
  });

  final DynoRunner runner;

  @override
  Widget build(BuildContext context, DynosViewModel viewModel) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(180 / 360),
      child: IconButton(
        icon: Icon(
          TablerIcons.rotate,
          color: runner.isActive ? kcYellow600 : kcNeutral600,
        ),
        onPressed: () => viewModel.dynoRunnerRestart(runner),
      ),
    );
  }
}

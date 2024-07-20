import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/makefiles/makefiles_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'widgets/restart_button.dart';
import 'widgets/start_button.dart';
import 'widgets/stop_button.dart';

class DynoRunnerWidget extends ViewModelWidget<MakefilesViewModel> {
  const DynoRunnerWidget({super.key, required this.runner});

  final DynoRunner runner;
  @override
  Widget build(BuildContext context, MakefilesViewModel viewModel) {
    const fgColor = kcStone300;
    final isSelected = viewModel.isDynoRunnerSelected(runner);
    final bgColor = isSelected ? kcRed100.withOpacity(0.05) : null;

    return GestureDetector(
      key: runner.key,
      onTap: () => viewModel.selectDynoRunner(runner),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: kp2.x(32).y(32),
          decoration: BoxDecoration(color: bgColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(runner.dyno.name).color(fgColor).fsLG(),
              if (viewModel.busy(runner)) const BusyIndicator(),
              const Spacer(),
              StartButton(runner: runner),
              const Space(16),
              RestartButton(runner: runner),
              const Space(16),
              StopButton(runner: runner),
            ],
          ),
        ),
      ),
    );
  }
}

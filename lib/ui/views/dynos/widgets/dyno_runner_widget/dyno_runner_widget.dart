import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/dynos/dynos_viewmodel.dart';
import 'package:devpanel/ui/views/dynos/widgets/dyno_runner_widget/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'widgets/restart_button.dart';
import 'widgets/start_button.dart';
import 'widgets/stop_button.dart';

class DynoRunnerWidget extends ViewModelWidget<DynosViewModel> {
  const DynoRunnerWidget({super.key, required this.runner});

  final DynoRunner runner;
  @override
  Widget build(BuildContext context, DynosViewModel viewModel) {
    const fgColor = kcNeutral300;
    final isSelected = viewModel.isDynoRunnerSelected(runner);
    final bgColor = isSelected ? kcNeutral200.withOpacity(.15) : null;
    final border = isSelected
        ? b(color: kcStone500, width: 1)
        : b(color: Colors.transparent);

    return GestureDetector(
      key: runner.key,
      onTap: () => viewModel.selectDynoRunner(runner),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: kp2.x(16).y(12),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border(top: border.top, bottom: border.bottom),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(runner.dyno.name).color(fgColor),
              if (viewModel.busy(runner)) const BusyIndicator(),
              const Spacer(),
              StartButton(runner: runner),
              const Space(16),
              RestartButton(runner: runner),
              const Space(16),
              StopButton(runner: runner),
              const Space(16),
              MenuButton(runner: runner),
              // const Space(16),
              // DeleteButton(runner: runner),
            ],
          ),
        ),
      ),
    );
  }
}

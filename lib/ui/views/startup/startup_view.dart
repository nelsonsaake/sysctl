import 'package:commons/commons.dart';
import 'package:devpanel/ui/common/app_assets.dart';
import 'package:devpanel/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return CenterLayout(
      children: [
        Container(
          color: kcStone800,
          width: vw(context),
          height: vh(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: kbrLG,
                child: SizedBox.square(
                  dimension: 100,
                  child: Image.asset(kaLogo),
                ),
              ),
              const Space2(),
              const Text(ksAppName).fcStone500().fsXL(),
            ],
          ),
        )
      ],
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}

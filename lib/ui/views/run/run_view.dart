import 'package:commons/commons.dart';
import 'package:devpanel/ui/views/_layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

import 'run_viewmodel.dart';

class RunView extends StackedView<RunViewModel> {
  const RunView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RunViewModel viewModel,
    Widget? child,
  ) {
    return Layout(
      title: "sh",
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showCreateSHDialog,
        backgroundColor: kcNeutral100,
        child: Container(
          child: Icon(TablerIcons.plus),
        ),
      ),
      child: Column(
        children: [
          //...
        ],
      ),
    );
  }

  @override
  RunViewModel viewModelBuilder(
    BuildContext context,
  ) {
    return RunViewModel();
  }

  @override
  void onViewModelReady(RunViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

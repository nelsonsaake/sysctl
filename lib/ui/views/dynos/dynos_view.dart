import 'package:commons/commons.dart';
import 'package:devpanel/ui/views/_layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

import 'dynos_viewmodel.dart';
import 'widgets/dyno_runner_widget/dyno_runner_widget.dart';
import 'widgets/no_stream.dart';

class DynosView extends StackedView<DynosViewModel> {
  const DynosView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DynosViewModel viewModel,
    Widget? child,
  ) {
    return Layout(
      child: LayoutData(
        isBusy: viewModel.isBusy,
        padding: kp0,
        useScroll: false,
        child: Column(
          children: [
            //...

            Container(
              padding: kp8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kcNeutral900,
                border: kb.b(),
              ),
              child: const SelectableText("Dynos")
                  .fcNeutral300()
                  .fsXL()
                  .fwSemiBold(),
            ),

            Expanded(
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kcNeutral900,
                        border: kb.r(),
                      ),
                      child: ListView.separated(
                        padding: kpt16,
                        itemCount: viewModel.dynoRunners.length,
                        separatorBuilder: (context, index) => const Space2(),
                        itemBuilder: (context, index) {
                          return DynoRunnerWidget(
                            runner: viewModel.dynoRunners[index],
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: kcNeutral800,
                      child: Builder(builder: (context) {
                        final runner = viewModel.selectedDynoRunner;
                        final out = runner?.out;
                        return Column(
                          children: [
                            //...

                            // Header Section
                            Container(
                              padding: kp4,
                              margin: kp4,
                              decoration: BoxDecoration(
                                border: kb.b(),
                              ),
                              child: SelectableText(
                                str(runner?.dyno.name ?? "no dyno available"),
                              ).fcNeutral600().fsXL().center(),
                            ),

                            // logs
                            if (out?.isNotEmpty == true)
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: kp4,
                                    alignment: Alignment.topLeft,
                                    child: SelectableText(out!)
                                        .fcNeutral300()
                                        .ffSourceCodePro()
                                        .fsXS(),
                                  ),
                                ),
                              )
                            else
                              const Expanded(
                                child: Center(
                                  child: NoStream(),
                                ),
                              ),

                            // log controls
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kcNeutral900,
                                border: kb.t(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      TablerIcons.trash,
                                      color: kcNeutral500,
                                    ),
                                    onPressed: () {
                                      viewModel.dynoRunnerClearLogs(runner!);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  DynosViewModel viewModelBuilder(
    BuildContext context,
  ) {
    return DynosViewModel();
  }

  @override
  void onViewModelReady(DynosViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

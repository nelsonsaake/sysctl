import 'package:commons/commons.dart';
import 'package:devpanel/ui/views/_layouts/layout.dart';
import 'package:devpanel/ui/views/dynos/widgets/log_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

import 'dynos_viewmodel.dart';
import 'widgets/dyno_runner_widget/dyno_runner_widget.dart';
import 'widgets/no_log_stream.dart';

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

            Expanded(
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: kcNeutral900,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kcNeutral950,
                              border: b(color: kcNeutral800).b(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    TablerIcons.search,
                                    color: kcNeutral600,
                                  ),
                                  onPressed: viewModel.showCreateSHDialog,
                                ),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      fillColor: kcNeutral950,
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    TablerIcons.plus,
                                    color: kcNeutral600,
                                  ),
                                  onPressed: viewModel.showCreateSHDialog,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              controller: viewModel.scrollController,
                              itemCount: viewModel.dynoRunners.length,
                              separatorBuilder: (context, index) =>
                                  const Space2(),
                              itemBuilder: (context, index) {
                                return DynoRunnerWidget(
                                  runner: viewModel.dynoRunners[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kcNeutral800,
                        border: kb.l(),
                      ),
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
                            Expanded(
                              child: (out?.isNotEmpty == true)
                                  ? const LogStream()
                                  : const Center(child: NoLogStream()),
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
                                      TablerIcons.square_rounded_minus,
                                      color: kcNeutral400,
                                    ),
                                    onPressed: viewModel.decrementFontSize,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      TablerIcons.square_rounded_plus,
                                      color: kcNeutral400,
                                    ),
                                    onPressed: viewModel.incrementFontSize,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      TablerIcons.trash_filled,
                                      color: kcNeutral400,
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

import 'package:commons/commons.dart';
import 'package:devpanel/ui/common/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return LayoutData(
      isBusy: viewModel.isBusy,
      padding: kp0,
      useScroll: false,
      child: BaseLayout(
        children: [
          //...

          Container(
            padding: kp8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kcStone900,
              border: kb.b(),
            ),
            child: const Text("Dynos").fcStone300().fsXL().fwSemibold(),
          ),

          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kcStone900,
                      border: kb.r(),
                    ),
                    child: ListView.separated(
                      padding: kpt16,
                      itemCount: viewModel.dynos.length,
                      separatorBuilder: (context, index) => const Space2(),
                      itemBuilder: (context, index) {
                        //...

                        final dyno = viewModel.dynos[index];
                        final isSelected = viewModel.isDynoSelected(dyno);
                        const fgColor = kcStone300;
                        final bgColor =
                            isSelected ? kcRed100.withOpacity(0.05) : null;

                        return GestureDetector(
                          onTap: () => viewModel.selectDyno(dyno),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              padding: kp2.x(32).y(32),
                              decoration: BoxDecoration(
                                color: bgColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(dyno.name).color(fgColor).fsLG(),
                                  const Spacer(),
                                  const Icon(
                                    TablerIcons.player_play,
                                    color: kcGreen600,
                                  ),
                                  const Space(16),
                                  const RotationTransition(
                                    turns: AlwaysStoppedAnimation(180 / 360),
                                    child: Icon(
                                      TablerIcons.rotate,
                                      color: kcYellow600,
                                    ),
                                  ),
                                  const Space(16),
                                  const Icon(
                                    TablerIcons.player_stop,
                                    color: kcRed600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: kcStone800,
                    child: Builder(builder: (context) {
                      //...

                      final dyno = viewModel.selectedDyno;

                      if (dyno == null) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: kbrLG,
                          ),
                          child: Image.asset(
                            kaResponsive,
                            height: 150,
                            width: 150,
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //...

                          // Header Section
                          Text(dyno.name).fcStone600().fsXL(),

                          // Build Controls
                          Container(
                            padding: kp2,
                            decoration: BoxDecoration(
                              borderRadius: kbrLG,
                            ),
                            child: SizedBox(
                              width: 200,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: kcStone600,
                                      borderRadius: br(4),
                                    ),
                                  ),
                                  const Space4(),
                                  Container(
                                    height: 2,
                                    margin: mr3(),
                                    decoration: BoxDecoration(
                                      color: kcStone600,
                                      borderRadius: br(1),
                                    ),
                                  ),
                                  const Space4(),
                                  Container(
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: kcStone600,
                                      borderRadius: br(4),
                                    ),
                                  ),
                                  const Space4(),
                                  Container(
                                    height: 2,
                                    margin: mr4(),
                                    decoration: BoxDecoration(
                                      color: kcStone600,
                                      borderRadius: br(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Console
                          const Text("no data streams yet").fcStone600().fsXL(),
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
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) {
    return HomeViewModel();
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

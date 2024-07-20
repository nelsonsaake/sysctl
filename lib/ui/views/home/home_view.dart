import 'package:commons/commons.dart';
import 'package:devpanel/ui/widget/row_with_separator.dart';
import 'package:flutter/material.dart';
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
            padding: kp2,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kcNeutral800,
              border: b(color: kcNeutral950).b(),
            ),
            child: const SelectableText("DevPanel")
                .fcNeutral50()
                .fsXL()
                .fwSemiBold(),
          ),

          Expanded(
            child: Container(
              color: kcNeutral700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowWithSeparator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final route in viewModel.routes.entries)
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => viewModel.nav.navigateTo(route.value),
                            child: Container(
                              padding: kp8,
                              width: kw60,
                              decoration: BoxDecoration(
                                color: kcNeutral800,
                                borderRadius: kbrMD,
                              ),
                              child: SelectableText(route.key)
                                  .fcNeutral50()
                                  .fsXL()
                                  .fwSemiBold(),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
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

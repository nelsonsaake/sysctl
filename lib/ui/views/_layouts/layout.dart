import 'package:commons/commons.dart';
import 'package:devpanel/ui/views/_layouts/layout_viewmodel.dart';
import 'package:devpanel/ui/widget/div.dart';
import 'package:devpanel/ui/widget/row_with_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

class Layout extends StackedView<LayoutViewmodel> {
  //...

  final Widget? child;
  final String? title;
  final Widget? floatingActionButton;

  const Layout({
    super.key,
    this.child,
    this.title,
    this.floatingActionButton,
  });

  @override
  Widget builder(
    BuildContext context,
    LayoutViewmodel viewModel,
    _,
  ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      backgroundColor: kcNeutral800,
      appBar: buildAppBar(viewModel),
      drawer: buildDrawer(viewModel),
      floatingActionButton: floatingActionButton,
      body: Container(child: child),
    );
  }

  Drawer buildDrawer(LayoutViewmodel viewModel) {
    return Drawer(
      backgroundColor: kcNeutral900,
      child: ListView(
        padding: kp4,
        children: [
          //...

          // Section label
          Container(
            padding: kpy8,
            child: const Text("Devpanel").fs5().ffGreatVibes().fcNeutral100(),
          ),

          const Divider(color: kcNeutral100),

          // Routes
          for (final route in LayoutViewmodel.drawerRoutes.entries)
            Div(
              margin: kpy2,
              onTap: () => viewModel.navigateTo(route.value),
              child: Text(route.key).fcNeutral100(),
            )
        ],
      ),
    );
  }

  AppBar buildAppBar(LayoutViewmodel viewModel) {
    return AppBar(
      leading: IconButton(
        onPressed: viewModel.openDrawer,
        icon: const Icon(
          TablerIcons.baseline_density_medium,
          size: 18,
        ),
      ),
      title: RowWithSeparator(
        crossAxisAlignment: CrossAxisAlignment.center,
        separator: Padding(
          padding: kpx4,
          child: const Icon(
            TablerIcons.chevron_right,
            size: 16,
            color: kcNeutral300,
          ),
        ),
        children: [
          const Text("Devpanel").fs5().ffGreatVibes(),
          if (title != null)
            Div(
              margin: kpb1,
              child: Text(title!.toUpperCase()).fs3(),
            ),
        ],
      ),
      backgroundColor: kcNeutral100,
    );
  }

  @override
  LayoutViewmodel viewModelBuilder(BuildContext context) {
    return LayoutViewmodel();
  }
}

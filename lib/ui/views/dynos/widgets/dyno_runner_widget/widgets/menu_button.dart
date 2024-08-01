import 'package:commons/commons.dart';
import 'package:devpanel/dynos/dyno_runner.dart';
import 'package:devpanel/ui/views/dynos/dynos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:stacked/stacked.dart';

class MenuButton extends ViewModelWidget<DynosViewModel> {
  const MenuButton({
    super.key,
    required this.runner,
  });

  final DynoRunner runner;

  Widget buildIcon(IconData icon) {
    return Icon(icon, color: kcNeutral500);
  }

  Widget buildEditButton(BuildContext context, DynosViewModel viewModel) {
    return IconButton(
      icon: buildIcon(TablerIcons.edit),
      onPressed: () => viewModel.showCreateSHDialog(),
    );
  }

  Widget buildDeleteButton(BuildContext context, DynosViewModel viewModel) {
    return IconButton(
      icon: buildIcon(TablerIcons.trash),
      onPressed: () => viewModel.deleteDyno(runner.dyno),
    );
  }

  @override
  Widget build(BuildContext context, DynosViewModel viewModel) {
    return PopupMenuButton(
      child: Icon(
        TablerIcons.dots_vertical,
        color: runner.isActive ? kcBlue500 : kcNeutral600,
      ),
      itemBuilder: (context) {
        final actions = {
          "Edit": buildEditButton(context, viewModel),
          "Delete": buildDeleteButton(context, viewModel),
        };
        return [
          for (final action in actions.entries)
            PopupMenuItem(
              padding: pxy(8, 0),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(action.key).fcNeutral500(),
                  const Space8.x(),
                  action.value,
                ],
              ),
            ),
        ];
      },
    );
  }
}

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
      onPressed: () {
        viewModel.deleteDyno(runner.dyno);
      },
    );
  }

  @override
  Widget build(BuildContext context, DynosViewModel viewModel) {
    final actions = [
      {
        "label": "Edit",
        "icon": TablerIcons.edit,
        "action": () => viewModel.showCreateSHDialog(),
      },
      {
        "label": "Delete",
        "icon": TablerIcons.trash,
        "action": () => viewModel.deleteDyno(runner.dyno),
      },
    ];
    return PopupMenuButton<int>(
      color: kcNeutral800,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Icon(
        TablerIcons.dots_vertical,
        color: runner.isActive ? kcBlue500 : kcNeutral600,
      ),
      itemBuilder: (context) => [
        for (int i = 0; i < actions.length; i++)
          PopupMenuItem<int>(
            value: i,
            padding: pxy(8, 0),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(actions[i]["label"] as String).fcNeutral500(),
                const Space8.x(),
                buildIcon(actions[i]["icon"] as IconData),
              ],
            ),
          ),
      ],
      onSelected: (index) {
        final action = actions[index]["action"] as VoidCallback;
        action();
      },
    );
  }
}

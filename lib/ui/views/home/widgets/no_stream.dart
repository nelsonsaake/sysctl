import 'package:commons/commons.dart';
import 'package:devpanel/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NoStream extends ViewModelWidget<HomeViewModel> {
  const NoStream({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //...

        NoStreamIllustration(),

        Space16(),
      ],
    );
  }
}

class NoStreamIllustration extends StatelessWidget {
  const NoStreamIllustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kpy8.l(40),
      width: 180,
      child: Builder(builder: (context) {
        const config = <List<double>>[
          [0, 52, 8],
          [8, 79, 16],
          [0, 32, 8],
          [8, 70, 16],
          [0, 54, 8],
          [8, 79, 16],
          [0, 64, 0],
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final line in config) ...[
              Container(
                height: 2,
                margin: ml(line[0]).r(line[1]),
                decoration: BoxDecoration(
                  color: kcStone600,
                  borderRadius: br(4),
                ),
              ),
              if (line.length > 2) Space(line[2])
            ],
          ],
        );
      }),
    );
  }
}

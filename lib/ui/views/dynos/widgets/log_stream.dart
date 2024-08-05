import 'package:commons/commons.dart';
import 'package:devpanel/ui/views/dynos/dynos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:stacked/stacked.dart';

class LogStream extends ViewModelWidget<DynosViewModel> {
  const LogStream({super.key});

  @override
  Widget build(BuildContext context, DynosViewModel viewModel) {
    return SingleChildScrollView(
      child: Container(
        // color: kcNeutral100,
        padding: kp4,
        alignment: Alignment.topLeft,
        child: false
            ? MarkdownBody(
                data: str(viewModel.out),
                selectable: true,
                styleSheet: MarkdownStyleSheet(
                  p: const SelectableText("")
                      .fcNeutral300()
                      .ffSourceCodePro()
                      .fsXS()
                      .style,
                ),
              )
            : SelectableText(str(viewModel.out))
                .fcNeutral300()
                .ffSourceCodePro()
                .fsXS(),
      ),
    );
  }
}

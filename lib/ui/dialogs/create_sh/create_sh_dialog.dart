import 'package:commons/commons.dart';
import 'package:devpanel/ui/dialogs/create_sh/create_sh_dialog_model.dart';
import 'package:devpanel/ui/widget/row_with_separator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateSHDialog extends StackedView<CreateShDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const CreateSHDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(BuildContext context, CreateShDialogModel viewModel, _) {
    return Dialog(
      backgroundColor: kcNeutral800,
      shape: RoundedRectangleBorder(
        borderRadius: kbrMD,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: kcNeutral800,
        textStyle: const Text("").fcNeutral100().style,
        child: ListView(
          padding: kp10,
          children: [
            const Text("New SH").fs10().center().ffTangerine(),
            const Space16(),

            //...
            const Text("Name:"),
            TextField(
              controller: viewModel.name,
            ),

            const Space16(),

            //...
            const Text("Working Directory:"),
            TextField(
              controller: viewModel.workingDirectory,
            ),

            const Space16(),

            //...
            const Text("Exec:"),
            TextField(
              controller: viewModel.exec,
            ),

            const Space16(),

            //...
            RowWithSeparator(
              mainAxisAlignment: MainAxisAlignment.end,
              separator: const Space8(),
              children: [
                Button(
                  "Cancel",
                  fillWidth: false,
                  backgroundColor: kcRed700,
                  onTap: viewModel.cancel,
                ),
                Button(
                  "Save",
                  fillWidth: false,
                  backgroundColor: kcGreen700,
                  onTap: viewModel.submit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  CreateShDialogModel viewModelBuilder(BuildContext context) {
    return CreateShDialogModel(request, completer);
  }
}

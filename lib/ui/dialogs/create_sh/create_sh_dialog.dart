import 'package:commons/commons.dart';
import 'package:devpanel/ui/dialogs/create_sh/create_sh_dialog_model.dart';
import 'package:devpanel/ui/widget/dp_text_button.dart';
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
    //...
    final form = {
      "Name": viewModel.name,
      "Working Directory": viewModel.workingDirectory,
      "Exec": viewModel.exec,
    };

    //...
    return Dialog(
      backgroundColor: kcNeutral800,
      shape: RoundedRectangleBorder(borderRadius: kbrMD),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 450,
        width: 540,
        child: Material(
          color: kcNeutral800,
          textStyle: const Text("").fcNeutral100().style,
          child: ListView(
            padding: kp10,
            children: [
              const Text("Create Sh").center().fs8(),
              const Space2(),

              //...
              for (final field in form.entries) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${field.key}:"),
                    const Space2(),
                    TextField(controller: field.value)
                  ],
                ),
                const Space4(),
              ],

              const Space4(),

              //...
              RowWithSeparator(
                mainAxisAlignment: MainAxisAlignment.end,
                separator: const Space8(),
                children: [
                  Expanded(
                    child: DPTextButton(
                      "Cancel",
                      setBorder: false,
                      backgroundColor: kcRed600,
                      onTap: viewModel.cancel,
                    ),
                  ),
                  Expanded(
                    child: DPTextButton(
                      "Save",
                      setBorder: false,
                      backgroundColor: kcGreen600,
                      onTap: viewModel.submit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CreateShDialogModel viewModelBuilder(BuildContext context) {
    return CreateShDialogModel(request, completer);
  }
}

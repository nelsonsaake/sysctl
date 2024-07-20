import 'package:devpanel/app/app.dialogs.dart';
import 'package:devpanel/viewmodels/context_viewmodel.dart';

class RunViewModel extends ContextViewModel {
  //...

  showCreateSHDialog() {
    dialogs.showCustomDialog(
      variant: DialogType.createSH,
    );
  }

  init() {}
}

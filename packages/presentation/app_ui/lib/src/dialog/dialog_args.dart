// ignore_for_file: public_member_api_docs

abstract interface class DialogArgsI {}

class DialogArgsCommon implements DialogArgsI {
  DialogArgsCommon({
    required this.title,
    required this.message,
    this.onConfirm,
    this.onCancel,
  });

  final String title;
  final String message;
  final Function? onConfirm;
  final Function? onCancel;
}

class DialogArgsInfo implements DialogArgsI {}
// class DialogArgsError implements DialogArgs {}
// class DialogArgsConfirmation implements DialogArgsI {}

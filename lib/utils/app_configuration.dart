import 'package:cutomer_builder/utils/exports.dart';

checkConnection() async {
  return await InternetConnectionChecker().hasConnection;
}

loadingDialog() {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: const LoadingDialog(),
    ),
    barrierDismissible: false,
  );
}

class LoadingDialog extends Dialog {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
          ),
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColor.blueColor,
            ),
          ),
        ),
      ),
    );
  }
}

Future getDisplayAlert(
  String title,
  String content,
) async {
  await Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        title: Text(title),
        content: Text(content),
        actions: [
          MaterialButton(
            child: const Text("Ok"),
            onPressed: () {
              Get.back();
              Get.focusScope?.unfocus();
            },
          )
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

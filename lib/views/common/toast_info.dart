import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/exports.dart';

toastInfo([String msg = ""]) {
  // [String msg = ""]: posotional optional parameter
  // when using it, no need to pass like msg:"" but only a String
  // but you can only use this way with only one parameter here
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: ColorConstants.backgroundSecondary,
    textColor: ColorConstants.textPrimary,
    fontSize: 16,
  );
}

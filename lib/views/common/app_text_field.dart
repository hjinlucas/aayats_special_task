import 'package:aayats_mobile_app/views/common/reusable_text.dart';
import 'package:flutter/material.dart';
import '../../constants/exports.dart';
import 'custom_image.dart';
import 'exports.dart';

Widget appTextField({
  required BuildContext context,
  TextEditingController? controller,
  required String text,
  required String iconPath,
  required String hintText,
  bool obscure = false,
  void Function(String value)? func,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 24),
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainText(text: text),
        const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: appImage(imagePath: iconPath),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      if (func != null) {
                        func(value);
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: ColorConstants.textSecondary,
                        fontFamily: "Lato",
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscure,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/app_constants.dart';


class Alert {

  static void message(String title,String msg,{bgColor= AppConstants.dangerColor, position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      title,
      msg,
      snackPosition: position,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      backgroundColor: bgColor.withOpacity(0.40),
    );
  }
}

class Confirm extends StatelessWidget {
  final String title, body;
  final String? confirmText, cancelText;
  final Function() onConfirm;
  final Function() onCancel;

  const Confirm({Key? key, required this.title, required this.body, required this.onConfirm, required this.onCancel, this.confirmText,this.cancelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 155,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.only(left: 20, right: 25, top: 20, bottom: 20,),
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 55,
                child: Text(
                  body,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      onCancel();
                    },
                    child: Text(
                      (cancelText ?? 'Cancel').toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    child: Text(
                      (confirmText ?? 'Confirm').toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

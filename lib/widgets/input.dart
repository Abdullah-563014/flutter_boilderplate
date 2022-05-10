import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final Widget? prefix;
  final validator;
  final onChanged;
  final initialValue;
  final bool? obscureText, readOnly;
  final int? maxLines;
  final TextInputType? type;

  const FormInput({
    Key? key,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.prefix,
    this.validator,
    required this.onChanged,
    this.obscureText,
    this.initialValue,
    this.type,
    this.maxLines,
    this.readOnly,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5e6773)),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: obscureText == null ? false : true,
          keyboardType: type,
          maxLines: maxLines,
          readOnly: readOnly ?? false,
          decoration: InputDecoration(
            fillColor: const Color(0xFFe3e4e8),
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            prefix: prefix,
            prefixStyle: const TextStyle(
              color: Color(0xFF5e6773),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: border,
            disabledBorder: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF5e6773),
            ),
          ),
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

const border = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
);

class Select extends StatelessWidget {
  final List<Map<String, String?>> options;
  final String value, title;
  final Function(String value) onChange;
  final bool? hideLabel;

  const Select({
    required this.title,
    required this.value,
    required this.onChange,
    required this.options,
    this.hideLabel,
  });

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    String? findName() {
      for (int i = 0; i < options.length; i++) {
        if (options[i]['value'] == value) {
          return options[i]['title'];
        }
      }
      return hideLabel == true ? title : '';
    }

    Widget bottomSheet = Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
              )),
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2 - 30,
              child: SingleChildScrollView(
                child: Column(
                  children: options
                      .map(
                        (option) => GestureDetector(
                          onTap: () {
                            onChange(option['value'] ?? '');
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Row(
                              children: [
                                Radio(
                                  value: value == option['value'],
                                  onChanged: (value) {
                                    onChange(option['value'] ?? '');
                                    Navigator.pop(context);
                                  },
                                  groupValue: true,
                                ),
                                Container(
                                  width: availableWidth - 80,
                                  child: Text(
                                    option['title'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Get.bottomSheet(bottomSheet);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hideLabel == true
                ? Container()
                : Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5e6773),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Color(0xFFe3e4e8),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    findName() ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5e6773),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class ShowOTP extends StatefulWidget {
  final Function(String value) onConfirm;

  const ShowOTP({Key? key, required this.onConfirm}) : super(key: key);

  @override
  _ShowOTPState createState() => _ShowOTPState();
}

class _ShowOTPState extends State<ShowOTP> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 20, right: 25, top: 20, bottom: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'গোপন নম্বরটি প্রবেশ করুন',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'রোগীকে প্রদত্ত ৪ ডিজিটের গোপন নম্বরটি প্রবেশ করুন',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: OTPTextField(
                        width: 180,
                        fieldStyle: FieldStyle.box,
                        onChanged: (value) {
                          setState(() {
                            otp = value;
                          });
                        },
                        onCompleted: (value) {
                          setState(() {
                            otp = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'বাতিল করুন'.toUpperCase(),
                          style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    GestureDetector(
                      onTap: ()  {
                        if(otp.length == 4) {
                          Navigator.of(context).pop();
                          widget.onConfirm(otp);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'সম্পন্ন করুন'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class UploadImage extends StatelessWidget {
  final onPick;

  const UploadImage({
    Key? key,
    this.onPick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    return Container(
      child: Center(
        child: Container(
          height: 110,
          width: 270,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  XFile? image =
                  await _picker.pickImage(source: ImageSource.camera);
                  if (onPick != null) {
                    onPick(image);
                  }
                },
                child: Container(
                  width: 110, decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.photo_camera, size: 32,),
                        SizedBox(height: 5,),
                        Text('Camera', style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
                  if (onPick != null) {
                    onPick(image);
                  }
                },
                child: Container(
                  width: 110, decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.photo_library, size: 32,),
                        SizedBox(height: 5,),
                        Text('Photo Library', style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
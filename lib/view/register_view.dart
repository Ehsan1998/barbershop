import 'package:barbershop/controller/register_controller.dart';
import 'package:barbershop/view/home_view.dart';
import 'package:barbershop/view/verification_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_svg/svg.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterController controller = Get.put(RegisterController());

  var textController = MaskedTextController(mask: '000 000 0000');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColorLight = Theme.of(context).primaryColorLight;
    return Scaffold(
      backgroundColor: primaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 165.0),
              child: Center(
                child: Container(
                  child: SvgPicture.asset('image/logo.svg'),
                  height: 0.18 * height,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Center(
              child: Text(
                'TIMINO',
                style: TextStyle(
                  fontFamily: 'titr2',
                  fontSize: width * 0.055,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: 280,
                child: Text(
                  'شماره موبایل',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 280,
              height: 50,
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(10),
                ],
                autofocus: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: primaryColorLight,
                  fontSize: 15,
                  fontFamily: 'sans_fa',
                ),
                cursorColor: primaryColor,
                decoration: InputDecoration(
                    prefix: Text(
                      '+98 ',
                      style: TextStyle(
                        color: primaryColorLight,
                      ),
                    ),
                    hintText: '998 765 4321',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none),
                onChanged: (value) {
                  controller.phoneNumber.value = value;
                  print('+98${value.toString().replaceAll(RegExp(' '), '')}');
                },
                onSubmitted: (value) {
                  controller.sendPhone(value);
                  print(value);
                  Get.to(VerficationView());
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                controller.sendPhone('0');
              },
              child: Container(
                child: Center(
                  child: Text(
                    'تایید شماره',
                    style: TextStyle(
                      color: primaryColorDark,
                      fontFamily: 'sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
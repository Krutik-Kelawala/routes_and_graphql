import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_project/utilities/common_logic.dart';
import 'package:test_project/utilities/custom_colors.dart';

class CommonWidgets {
  // TODO common print function
  static printFunction(String text) {
    if (kDebugMode) {
      print(text);
    }
  }

  static commonButton(num width, Color customColor, String btnName) {
    return Container(
      width: width.toDouble(),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.01),
      decoration: BoxDecoration(color: customColor, borderRadius: BorderRadius.circular(CommonLogic.textSize * 0.005)),
      child: Text(btnName, style: TextStyle(color: CustomColors.whiteTextColor, fontSize: CommonLogic.textSize * 0.02, fontFamily: "Switzer")),
    );
  }

  // TODO use common height box
  static heightBox(num textSize, double value) {
    return SizedBox(
      height: textSize * value,
    );
  }

  // TODO use common width box
  static widthBox(num textSize, double value) {
    return SizedBox(
      width: textSize * value,
    );
  }

  // TODO use common explore button
  static commonExploreAllBtn(String btnName) {
    return Center(
      child: IntrinsicWidth(
        child: Container(
          // width: CommonLogic.textSize * 0.185,
          padding: EdgeInsets.symmetric(horizontal: CommonLogic.textSize * 0.01, vertical: CommonLogic.textSize * 0.01),
          // margin: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.03),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: CustomColors.greyTextColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                btnName,
                style: TextStyle(fontSize: CommonLogic.textSize * 0.02, fontWeight: FontWeight.bold, color: CustomColors.greyTextColor),
              ),
              CommonWidgets.widthBox(CommonLogic.textSize, 0.01),
              Icon(Icons.arrow_forward, size: CommonLogic.textSize * 0.025, color: CustomColors.greyTextColor)
            ],
          ),
        ),
      ),
    );
  }

  // TODO use cart icon button
  static commonCartIconBtn() {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(CommonLogic.textSize * 0.005), border: Border.all(color: CustomColors.greyTextColor, width: 2)),
        padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.005, horizontal: CommonLogic.textSize * 0.005),
        margin: EdgeInsets.symmetric(horizontal: CommonLogic.textSize * 0.01),
        child: Icon(Icons.add_shopping_cart_outlined, size: CommonLogic.textSize * 0.035, color: CustomColors.greyTextColor));
  }

  // TODO use for how many people suggest this course
  static courseLikeDialog(BuildContext context, String mentorImage, String mentorName) {
    return Theme(
      data: ThemeData(dialogBackgroundColor: CustomColors.whiteTextColor),
      child: AlertDialog(
          titlePadding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.02),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mentors",
                      style: TextStyle(
                        fontSize: CommonLogic.textSize * 0.016,
                        color: CustomColors.greyTextColor,
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.005, horizontal: CommonLogic.textSize * 0.005),
                          child: Icon(Icons.clear, size: CommonLogic.textSize * 0.03, color: CustomColors.greyTextColor)))
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.005),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: CommonLogic.textSize * 0.01),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(mentorImage),
                              radius: CommonLogic.textSize * 0.016,
                            ),
                          ),
                          Flexible(
                            child: Text(mentorName,
                                style: TextStyle(
                                    fontSize: CommonLogic.textSize * 0.016, color: CustomColors.greyTextColor, decoration: TextDecoration.underline, decorationColor: CustomColors.greyTextColor)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }

  // TODO common appbar
  static commonAppBar(
    String screenTitle,
  ) {
    return AppBar(
      surfaceTintColor: CustomColors.transparent,
      iconTheme: IconThemeData(color: CustomColors.blackTextColor),
      title: Padding(
        padding: EdgeInsets.only(top: CommonLogic.textSize * 0.007),
        child: Text(screenTitle, style: TextStyle(fontFamily: 'Switzer', fontSize: CommonLogic.textSize * 0.023, color: CustomColors.blackTextColor)),
      ),
      backgroundColor: CustomColors.whiteTextColor,
      // titleSpacing: 0,
      // elevation: 0,
    );
  }
}

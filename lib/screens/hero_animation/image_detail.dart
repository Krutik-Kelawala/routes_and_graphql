import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_project/models/imageDataModel/image_data.dart';
import 'package:test_project/utilities/common_logic.dart';
import 'package:test_project/utilities/custom_colors.dart';
import 'package:test_project/widgets/common_widgets.dart';

class ImageDetailScreen extends StatefulWidget {
  final List<Photo> imageDetailRes;
  final int index;

  const ImageDetailScreen({Key? key, required this.imageDetailRes, required this.index}) : super(key: key);

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    CommonLogic.initiateHeightWidth(context);
    return Scaffold(
        appBar: AppBar(title: Text("Detail Screen", style: TextStyle(fontSize: CommonLogic.textSize * 0.02))),
        body: Container(
            // width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.02),
            padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.015, horizontal: CommonLogic.textSize * 0.01),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Hero(
                    tag: "image${widget.index}",
                    child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                child: Image.network(
                                  widget.imageDetailRes[widget.index].url,
                                  height: CommonLogic.textSize * 0.3,
                                  width: CommonLogic.textSize * 0.3,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(height: CommonLogic.textSize * 0.3, width: CommonLogic.textSize * 0.3, color: CustomColors.unselectedColor);
                                  },
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                        child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(height: CommonLogic.textSize * 0.3, width: CommonLogic.textSize * 0.3, color: CustomColors.whiteTextColor),
                                    ));
                                  },
                                ))))),
                CommonWidgets.heightBox(CommonLogic.textSize, 0.02),
                Container(
                    padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.02),
                    child: Text("Title : ${widget.imageDetailRes[widget.index].title}", style: TextStyle(fontSize: CommonLogic.textSize * 0.02, color: CustomColors.blackTextColor))),
                Text("Description : ${widget.imageDetailRes[widget.index].description}", style: TextStyle(fontSize: CommonLogic.textSize * 0.02, color: CustomColors.blackTextColor))
              ]),
            )));
  }
}

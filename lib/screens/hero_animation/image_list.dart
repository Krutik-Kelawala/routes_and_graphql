import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_project/blocs/image_list_bloc/image_list_bloc.dart';
import 'package:test_project/models/imageDataModel/image_data.dart';
import 'package:test_project/repository/repository.dart';
import 'package:test_project/routeFile.dart' as route;
import 'package:test_project/utilities/common_logic.dart';
import 'package:test_project/utilities/custom_colors.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({Key? key}) : super(key: key);

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  late ImageDataModel imageDataModelRes;

  @override
  Widget build(BuildContext context) {
    CommonLogic.initiateHeightWidth(context);
    return Scaffold(
      appBar: AppBar(title: Text("Image List", style: TextStyle(fontSize: CommonLogic.textSize * 0.02))),
      body: BlocProvider(
        create: (context) => ImageListBloc(Repository())..add(GetImageList()),
        child: blocProviderVIew(),
      ),
    );
  }

  Widget blocProviderVIew() {
    return BlocConsumer<ImageListBloc, ImageListState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ImageListInitial) {
          // return const Center(child: CircularProgressIndicator());
          return shimmerLoadingView();
        } else if (state is ImageListLoading) {
          // return const Center(child: CircularProgressIndicator());
          return shimmerLoadingView();
        } else if (state is ImageListLoaded) {
          imageDataModelRes = state.imageDataModel;
          return blocConsumerView();
        } else if (state is ImageListError) {
          return Center(child: Text(state.errorMessage, style: TextStyle(color: CustomColors.blackTextColor, fontSize: CommonLogic.textSize * 0.02)));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget blocConsumerView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: imageDataModelRes.photos.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, route.imageDetailScreen, arguments: [imageDataModelRes.photos, index]);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.02),
                  padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.015, horizontal: CommonLogic.textSize * 0.015),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: CustomColors.unselectedColor, width: 1), color: CustomColors.bgColor),
                  child: Row(children: [
                    Hero(
                        tag: "image$index",
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                                child: Image.network(
                                  imageDataModelRes.photos[index].url,
                                  height: CommonLogic.textSize * 0.1,
                                  width: CommonLogic.textSize * 0.1,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(height: CommonLogic.textSize * 0.1, width: CommonLogic.textSize * 0.1, color: CustomColors.unselectedColor);
                                  },
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor: Colors.grey.shade100,
                                            child: Container(height: CommonLogic.textSize * 0.1, width: CommonLogic.textSize * 0.1, color: CustomColors.whiteTextColor)));
                                  },
                                )))),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: CommonLogic.textSize * 0.01),
                            child: Text(imageDataModelRes.photos[index].title, style: TextStyle(fontSize: CommonLogic.textSize * 0.02, color: CustomColors.blackTextColor))))
                  ])));
        });
  }

  Widget shimmerLoadingView() {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.02),
                  padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.015, horizontal: CommonLogic.textSize * 0.015),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: CustomColors.unselectedColor, width: 1)),
                  child: Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            child: Container(color: CustomColors.whiteTextColor, height: CommonLogic.textSize * 0.1, width: CommonLogic.textSize * 0.1))),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                          height: CommonLogic.textSize * 0.02,
                          width: CommonLogic.textSize * 0.1,
                          color: CustomColors.whiteTextColor,
                          margin: EdgeInsets.symmetric(horizontal: CommonLogic.textSize * 0.01, vertical: CommonLogic.textSize * 0.01)),
                      Container(
                          height: CommonLogic.textSize * 0.02,
                          width: CommonLogic.textSize * 0.2,
                          color: CustomColors.whiteTextColor,
                          margin: EdgeInsets.symmetric(horizontal: CommonLogic.textSize * 0.01)),
                    ])
                  ])));
        });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/models/imageDataModel/image_data.dart';
import 'package:test_project/repository/repository.dart';
import 'package:test_project/widgets/common_widgets.dart';

part 'image_list_event.dart';

part 'image_list_state.dart';

class ImageListBloc extends Bloc<ImageListEvent, ImageListState> {
  final Repository repository;
  late ImageDataModel? imageDataModel;

  ImageListBloc(this.repository) : super(ImageListInitial()) {
    on<ImageListEvent>((event, emit) async {
      if (event is GetImageList) {
        CommonWidgets.printFunction("Image list bloc called");
        emit(ImageListLoading());

        imageDataModel = await Repository.getImageData();

        if (imageDataModel!.success) {
          // TODO image model add in loaded state
          emit(ImageListLoaded(imageDataModel!));
        } else {
          // TODO error add in error state
          emit(ImageListError(imageDataModel!.message));
        }
      }
    });
  }
}

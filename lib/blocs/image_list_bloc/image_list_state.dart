part of 'image_list_bloc.dart';

@immutable
abstract class ImageListState {}

class ImageListInitial extends ImageListState {}

class ImageListLoaded extends ImageListState {
  final ImageDataModel imageDataModel;

  ImageListLoaded(this.imageDataModel);
}

class ImageListLoading extends ImageListState {}

class ImageListError extends ImageListState {
  final String errorMessage;

  ImageListError(this.errorMessage);
}

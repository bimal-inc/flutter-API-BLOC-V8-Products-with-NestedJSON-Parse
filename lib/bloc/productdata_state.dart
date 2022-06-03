part of 'productdata_bloc.dart';

@immutable
abstract class ProductdataState {}

class ProductdataInitialState extends ProductdataState {}

class ProductdataLoadingState extends ProductdataState {}

class ProductdataLoadedState extends ProductdataState {
  final List<Product> apiResult;
  ProductdataLoadedState({required this.apiResult});
}

class ProductdataErrorState extends ProductdataState {
  final String error;
  ProductdataErrorState({required this.error});
}

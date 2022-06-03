import 'package:api_testing/services/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/user_model.dart';

part 'productdata_event.dart';
part 'productdata_state.dart';

class ProductdataBloc extends Bloc<ProductdataEvent, ProductdataState> {
  final ProductRepo productRepo;

  ProductdataBloc(
    this.productRepo,
  ) : super(ProductdataInitialState()) {
    on<ProductdataEvent>((event, emit) async {
      if (event is LoadProductdataEvent) {
        emit(ProductdataLoadingState());
        List<Product>? apiresult = await productRepo.productData();
        if (apiresult == null) {
          emit(ProductdataErrorState(error: 'Erorr'));
        } else {
          emit(ProductdataLoadedState(apiResult: apiresult));
        }
      }
    });
  }
}

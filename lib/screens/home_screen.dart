import 'package:api_testing/bloc/productdata_bloc.dart';
import 'package:api_testing/models/user_model.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// import material ui
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductdataBloc, ProductdataState>(
        builder: (context, state) {
          if (state is ProductdataInitialState) {
            context.read<ProductdataBloc>().add(LoadProductdataEvent());
            return const Center(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is ProductdataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductdataLoadedState) {
            return buildGameModel(state.apiResult);
          } else if (state is ProductdataErrorState) {
            return Center(child: Text("Something went wrong"));
          }
          return const Text("Error");
        },
      ),
    );
  }

  Widget buildGameModel(List<Product> apiResult) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final Product productModel = apiResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: InkWell(
            onTap: () {
              //context.router.push(DetailsRoute(dataModel: dataModel));
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: 230,
                      width: MediaQuery.of(context).size.width / 1.05,
                      fit: BoxFit.cover,
                      image: NetworkImage(productModel.image),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width / 1.05,
                      height: 120,
                      border: 0,
                      borderRadius: 0,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                productModel.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Platforms: " + productModel.description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
      },
    );
  }
}

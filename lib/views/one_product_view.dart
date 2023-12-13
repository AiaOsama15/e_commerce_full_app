import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery_state.dart';

import 'package:e_commerce_app/widgets/build_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneProductView extends StatefulWidget {
  const OneProductView({super.key});

  @override
  State<OneProductView> createState() => _OneProductViewState();
}

class _OneProductViewState extends State<OneProductView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCatogeryCubit, GetCatogeryState>(
      listener: (context, state) {
        if (State is LoadingCatogeryState) {
          const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                  value: 20.0, backgroundColor: Colors.blueAccent),
            ),
          );
        }
        if (State is GetCatogeryfailerState) {
          const SizedBox(
            height: 300,
            child: Center(
              child: Text('date is not here yet ...'),
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<GetCatogeryCubit, GetCatogeryState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(title: const Text('favourte product')),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildGridCatogory(context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
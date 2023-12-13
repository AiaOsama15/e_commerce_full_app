import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/model/date_model.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/views/name_of_product.dart';
import 'package:flutter/material.dart';

//get product apis

List<Datum>? listOfCatogeryData;
Datum? oneDatumItem;

buildGridCatogory(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 2.1, // spacing between rows
          crossAxisSpacing: 1.6, // spacing between columns
        ),
        itemCount: listOfCatogeryData == null ? 0 : listOfCatogeryData!.length,
        itemBuilder: (BuildContext _, int index) {
          listOfCatogeryData = GetCatogeryCubit.objectOfModel!.data.data;
          // print(' listOfCatogeryData : $listOfCatogeryData');
          return buildOneProductItem(listOfCatogeryData![index], context);
        }),
  );
}

buildOneProductItem(Datum? oneDatumItem, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return NameOfProduct(
              
                appBarTitle: oneDatumItem.name,
                productPrice: oneDatumItem.price as String);
          },
        ),
      );
    },
    child: Container(
      height: 380,
      width: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 222, 222),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(oneDatumItem!.image),
                  ),
                ),
              ),
              Expanded(
                child: Text(oneDatumItem.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: thinTextStyle,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: true,
                    ),
                    textDirection: TextDirection.rtl),
              ),
              hsSizedBox,
              Text(
                '${oneDatumItem.price}',
                style: thinColorTextStyle,
                textAlign: TextAlign.start,
              ),
              hsSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${oneDatumItem.oldPrice}',
                    style: thinTextStyle,
                  ),
                  wsSizedBox,
                  Text(
                    '${oneDatumItem.discount}',
                    style: thinRedColorTextStyle,
                  ),
                ],
              )
            ]),
      ),
    ),
  );
}
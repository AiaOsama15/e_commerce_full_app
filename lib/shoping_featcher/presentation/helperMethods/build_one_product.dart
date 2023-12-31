import 'package:e_commerce_app/model/date_model.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shoping_featcher/presentation/views/Product_details.dart';
import 'package:flutter/material.dart';

buildOneProductItem(Datum? oneDatumItem, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ProductDetails(
                appBarTitle: oneDatumItem.name,
                productPrice: oneDatumItem.price,
                listOfproductImage: oneDatumItem.images,
                description: oneDatumItem.description,
                inFavorites: oneDatumItem.inFavorites,
                inCart: oneDatumItem.inCart,
                objFromModel: oneDatumItem,
                productId: oneDatumItem.id);
          },
        ),
      );
    },
    child: Container(
      height: 400,
      width: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 222, 222),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(oneDatumItem!.image),
                ),
              ),
            ),
            hsSizedBox,
            Text(oneDatumItem.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: thinTextStyle,
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: true,
                ),
                textDirection: TextDirection.rtl),
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
                  ' ${oneDatumItem.discount}%',
                  style: thinRedColorTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

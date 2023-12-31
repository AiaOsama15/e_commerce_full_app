import 'package:e_commerce_app/Login_featcher/presentation/helper_mehods/build_elevated_button.dart';
import 'package:e_commerce_app/cartFeatcher/presentation/views/cartView.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/shared/navigator.dart';
import 'package:e_commerce_app/shoping_featcher/presentation/helperMethods/build_select_color.dart';
import 'package:e_commerce_app/shoping_featcher/presentation/helperMethods/build_size_product.dart';
import 'package:e_commerce_app/shoping_featcher/presentation/widgets/CustomCarouselSliderProduct.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  //take model
  String appBarTitle;
  double productPrice;
  List listOfproductImage;
  String description;
  bool inFavorites;
  bool inCart;
  var objFromModel;
  int productId;

  ProductDetails(
      {super.key,
      required this.appBarTitle,
      required this.productPrice,
      required this.listOfproductImage,
      required this.description,
      required this.inFavorites,
      required this.inCart,
      required this.objFromModel,
      required this.productId});

  @override
  State<ProductDetails> createState() => _NameOfProductState();
}

class _NameOfProductState extends State<ProductDetails> {
  // String appbarTitleName;
  // {required this.appbarTitleName}
  _NameOfProductState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: [
          const Icon(
            Icons.search,
          ),
          hsSizedBox,
          const Icon(Icons.list),
          hsSizedBox,
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: buildElevated(
                onPressFunction: () {
                  navigate(
                    context,
                    CartView(productId: widget.productId),
                  );
                },
                isnotRow: true,
                text: 'Add to cart'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarouselSliderProduct(
                listOfproductImage: widget.listOfproductImage,
              ),
              hSizedBox,
              hSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  SizedBox(
                    height: 80,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Center(
                      child: Text(
                        widget.appBarTitle,
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        style: boldTextStyle,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 26,
                    icon: const Icon(Icons.favorite, color: Colors.redAccent),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star, color: Colors.yellowAccent),
              ),
              hsSizedBox,
              Text(
                '${widget.productPrice} \$',
                style: vboldColorTextStyle,
              ),
              hSizedBox,
              Text(
                'Select Size ',
                style: boldTextStyle,
              ),
              hsSizedBox,
              buildSelectSize(),
              hSizedBox,
              Text(
                'Select Colors ',
                style: boldTextStyle,
              ),
              hSizedBox,
              selectColorOfProduct(),
              hSizedBox,
              Container(
                // constraints: BoxConstraints(maxHeight: ) ,
                padding: const EdgeInsets.all(6),
                color: greyColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Specification',
                      style: vboldTextStyle,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReadMoreText(
                          widget.description,
                          trimLines: 2,
                          textDirection: TextDirection.rtl,
                          style: boldTextStyle,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Length,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        // Text(
                        //   widget.description,
                        //   textDirection: TextDirection.rtl,
                        //   style: boldTextStyle,
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        hsSizedBox,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

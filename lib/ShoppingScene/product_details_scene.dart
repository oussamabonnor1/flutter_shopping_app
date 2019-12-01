import 'package:flutter/material.dart';
import 'package:flutter_design_showcase/ShoppingScene/shopping_model.dart';
import 'package:flutter_design_showcase/ShoppingScene/shopping_scene.dart';

class ProductDetails extends StatefulWidget {
  ShoppingModel product;

  ProductDetails(this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ShoppingScene.accentColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.bookmark_border,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: ShoppingScene.accentColor,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Hero(
                    tag: widget.product.title,
                    child: Image(
                      image: widget.product.productImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(26),
                              topRight: Radius.circular(26),
                            )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,8,0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: widget.product.productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: widget.product.productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: widget.product.productImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26)),
                            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(42, 16, 32, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ShoppingScene.unselectedColor,
                                    letterSpacing: 2),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                                child: Text(
                                  widget.product.info1 +
                                      "\n" +
                                      widget.product.info2,
                                  softWrap: true,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                "More...",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: ShoppingScene.unselectedColor,
                                ),
                              ),
                            ],
                          ),
                        )),
                        Expanded(
                            child: Card(
                          color: ShoppingScene.backgroundColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26),
                            topRight: Radius.circular(26),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 36, right: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.product.price.toString() + " \$",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                                FlatButton(
                                  color: ShoppingScene.unselectedColor,
                                  padding: EdgeInsets.fromLTRB(62, 16, 62, 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  onPressed: () {},
                                  child: Text(
                                    "Buy",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

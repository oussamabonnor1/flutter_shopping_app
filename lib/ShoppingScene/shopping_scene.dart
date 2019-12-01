import 'package:flutter/material.dart';
import 'package:flutter_design_showcase/ShoppingScene/shopping_card.dart';
import 'package:flutter_design_showcase/ShoppingScene/shopping_model.dart';

class ShoppingScene extends StatefulWidget {
  static Color backgroundColor = Color(0xFF7C9A9A);
  static Color highlightColor = Color(0xFF8CA7A2);
  static Color unselectedColor = Color(0xFF68837E);
  static Color accentColor = Color(0xFFDABBA7);
  static Color textDarkColor = Color(0xFF5E5E5E);
  static Color textLightColor = Color(0xFFC4C4C4);

  @override
  _ShoppingSceneState createState() => _ShoppingSceneState();
}

class _ShoppingSceneState extends State<ShoppingScene> {
  List<String> categories = ["All", "Shoes", "Cars", "Food", "Pets", "Drinks"];
  List<ShoppingModel> products = [
    new ShoppingModel("Chery QQ", "Cars", 6083.00,
        AssetImage("images/car3.png"), "Cheap", "Practical"),
    new ShoppingModel("Dacia Logan", "Cars", 12299.99,
        AssetImage("images/car2.png"), "Economic", "Spacious"),
    new ShoppingModel("Nike", "Shoes", 199.99, AssetImage("images/shoe2.png"),
        "Confortable", "Sportsy"),
    new ShoppingModel("Nike Air", "Shoes", 349.99, AssetImage("images/shoe3.png"),
        "Modern", "Popular"),
    new ShoppingModel("Peugeot 308", "Cars", 16499.99,
        AssetImage("images/car1.png"), "Luxerious", "Fast"),
    new ShoppingModel("Timberland", "Shoes", 249.99,
        AssetImage("images/shoe1.png"), "Robust", "Stylish"),
  ];
  int selectedCategories = 0;
  String searchedProduct = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop",
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        backgroundColor: ShoppingScene.backgroundColor,
        elevation: 0,
      ),
      body: Container(
        color: ShoppingScene.backgroundColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: TextField(
                onChanged: (text) {
                  searchedProduct = text;
                  setState(() {});
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: ShoppingScene.highlightColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ShoppingScene.highlightColor),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ShoppingScene.highlightColor),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ShoppingScene.highlightColor),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                  prefixIcon: Icon(Icons.search, color: Colors.white, size: 28),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
              child: Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return index == selectedCategories
                          ? selectedCategoryCard(categories[index])
                          : unselectedCategoryCard(categories[index], index);
                    }),
              ),
            ),
            Expanded(
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
                        flex: 4,
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
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            height: getDividerHeight(index),
                            color: Colors.transparent,
                          ),
                      padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return getProductCard(index);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectedCategoryCard(String category) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: ShoppingScene.highlightColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget unselectedCategoryCard(String category, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategories = index;
        });
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                  color: ShoppingScene.unselectedColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget getProductCard(int index) {
    //THIS IS THE SPAGHETTIEST CODE I VE WRITTEN IN YEARS OH DEAR GOD
    if (selectedCategories != 0) {
      if (products[index].tag == categories[selectedCategories]) {
        if(searchedProduct == "")
        return ShoppingCard(products[index]);
        else{
          if (products[index]
              .title
              .toLowerCase()
              .contains(searchedProduct.toLowerCase()))
            return ShoppingCard(products[index]);
          else
            return SizedBox();
        }
      } else
        return SizedBox();
    } else {
      if (searchedProduct == "") {
        return ShoppingCard(products[index]);
      } else {
        if (products[index]
            .title
            .toLowerCase()
            .contains(searchedProduct.toLowerCase()))
          return ShoppingCard(products[index]);
        else
          return SizedBox();
      }
    }
  }

  double getDividerHeight(int index) {
    if (selectedCategories == 0)
      return 5;
    else {
      if (products[index].tag == categories[selectedCategories])
        return 5;
      else
        return 0;
    }
  }
}

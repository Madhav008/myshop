import 'package:flutter/material.dart';
import 'package:myshop/controllers/authentications.dart';
import 'package:myshop/model/product.dart';
import 'package:myshop/model/products.dart';
import 'package:myshop/widgets/constants.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'drawer.dart';

class TasksPage extends StatelessWidget {
  final String uid;
  TasksPage({this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Shop",
          style: TextStyle(
            fontFamily: "tepeno",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => AuthService().signOutUser().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false);
            }),
          )
        ],
      ),
      drawer: CustomDrawer(uid),
      body: ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Provider.of<Products>(context).fetchAndSetProducts();

    var products = Provider.of<Products>(context).items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (75 / 100),
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(value: products[index],child: ProductCard(),);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    return Card(
      elevation: 4.0,
      child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
      SizedBox(
        height: 8.0,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Image.network(
                productData.imageUrl,
                fit: BoxFit.fill,
              ),
              height: 150,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  
                  productData.title?? 'Loading...',
                  style: TextStyle(
                    
                      fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Text(
                '\₹' + productData.price.toString() ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.yellow),
              ),
            )
          ],
        ),
      )
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lmsadminpanle/views/root/subPages/categories/widgets/top_card.dart';
import 'widgets/product_table.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          TopCard(
              title: "Products",
              buttonText: "Add Product",
              isSmall: width > 800 ? false : true),
          const ProductsTable(),
        ],
      ),
    );
  }
}

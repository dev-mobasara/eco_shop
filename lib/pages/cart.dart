import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/cartcontroler.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daraz"),
        centerTitle: true,
      ),
      body: Consumer<CController>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.product.length,
          itemBuilder: (context, index) => ListTile(
            leading: Image.network(value.product[index].image),
            title: Text(value.product[index].name),
            subtitle: Text(
              value.product[index].price.toString(),
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<CController>().removeToCart(value.product[index]);
              },
              icon: const Icon(
                Icons.remove_circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

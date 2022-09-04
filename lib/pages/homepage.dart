import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/api/apiservice.dart';
import 'package:shop/controller/cartcontroler.dart';
import 'package:shop/models/model.dart';

class HomePageProduct extends StatelessWidget {
  const HomePageProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Model>>(
      future: APIService.getModel(),
      builder: (context, snapshot) => GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    snapshot.data![index].image,
                    scale: 2.75,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data![index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          context
                              .read<CController>()
                              .addToCart(snapshot.data![index]);
                          print("add one");
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                        ),
                      ),
                      Text("\$ ${snapshot.data![index].price} "),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

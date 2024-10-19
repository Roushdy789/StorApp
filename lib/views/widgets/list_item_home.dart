import 'package:flutter/material.dart';
import 'package:storeapp/Models/product.dart';

class ListItemHome extends StatelessWidget {
  const ListItemHome({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(product.imageUrl, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        '${product.descountValue}%',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              product.category,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey),
            ),
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(),
            ),
            Text(
              '${product.price}\$',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(),
            )
          ],
        ),
      ),
    );
  }
}

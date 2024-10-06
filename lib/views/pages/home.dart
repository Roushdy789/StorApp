import 'package:flutter/material.dart';
import 'package:storeapp/Models/product.dart';
import 'package:storeapp/utilities/assest.dart';
import 'package:storeapp/views/widgets/list_item_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  Widget _buildHeraderOflist(BuildContext context,
      {required String title,
      VoidCallback? onTap,
      required String descaription}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              InkWell(
                onTap: onTap,
                child: const Text("View All"),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                descaription,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey, fontSize: 12),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                AppAssets.TapBannerHomePageAssets,
                width: double.infinity,
                fit: BoxFit.cover,
                height: size.height * 0.3,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Text(
                  "Street clothes",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 34),
                ),
              )
            ],
          ),
          _buildHeraderOflist(
            context,
            title: "Sale",
            descaription: "Super summer sale",
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: products
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItemHome(product: e),
                      ))
                  .toList(),
            ),
          ),
          _buildHeraderOflist(
            context,
            title: "New",
            descaription: "You've never seen it before ",
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: products
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItemHome(product: e),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    ));
  }
}

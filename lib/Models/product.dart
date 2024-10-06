import 'package:storeapp/utilities/assest.dart';

class Product {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final int? descountValue;
  final String category;
  final double? rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.descountValue,
    this.category = "Others",
    this.rating,
  });
}

List<Product> products = [
  Product(
    id: 'p1',
    title: 'Red Shirt',
    price: '29.99',
    imageUrl: AppAssets.tempProductAssets,
    descountValue: 10,
    category: 'Shirt',
    rating: 4.0,
  ),
  Product(
    id: 'p2',
    descountValue: 20,
    title: 'Trousers',
    price: '59.99',
    imageUrl: AppAssets.tempProductAssets2,
  ),
  Product(
    id: 'p3',
    title: 'Red Shirt',
    price: '29.99',
    imageUrl: AppAssets.tempProductAssets,
    descountValue: 10,
    category: 'Shirt',
    rating: 4.0,
  ),
  Product(
    id: 'p4',
    descountValue: 20,
    title: 'Trousers',
    price: '59.99',
    imageUrl: AppAssets.tempProductAssets2,
  ),
  Product(
    id: 'p5',
    title: 'Red Shirt',
    price: '29.99',
    imageUrl: AppAssets.tempProductAssets,
    descountValue: 10,
    category: 'Shirt',
    rating: 4.0,
  ),
  Product(
    id: 'p6',
    descountValue: 20,
    title: 'Trousers',
    price: '59.99',
    imageUrl: AppAssets.tempProductAssets2,
  ),
];

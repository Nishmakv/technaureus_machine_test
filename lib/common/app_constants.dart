import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

const baseUrl = "http://143.198.61.94:8000";

List<ProductModel> homeProducts = [
  ProductModel(
    id: 100,
    name: 'Chicken Broiler',
    image: 'assets/images/chicken_img.png',
    price: 35,
  ),
  ProductModel(
    id: 101,
    name: 'Beef Tenderloin',
    image: 'assets/images/beef_img.png',
    price: 45,
  ),
];
List<Categories> categoriesData = [
  Categories(name: 'Fruit', image: 'assets/images/fruit_image.png'),
  Categories(name: 'Veggie', image: 'assets/images/veggie_image.png'),
  Categories(name: 'Spice', image: 'assets/images/spice_image.png'),
  Categories(name: 'Bread', image: 'assets/images/bread_image.png'),
  Categories(name: 'Dairy', image: 'assets/images/dairy_image.png'),
];

const List<String> bannerImages = [
  'assets/images/banner_image1.jpg',
  'assets/images/banner_image2.jpg',
  'assets/images/banner_image3.jpg',
  'assets/images/fruit_image.png',
  'assets/images/veggie_image.png',
];

import 'package:technaureus_machine_test/features/products/domain/models/models.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/category_class.dart';

const baseUrl = "http://143.198.61.94:8000/";

List<ProductModel> homeProducts = [
  ProductModel(
      id: 100,
      name: 'Chicken Broiler',
      image: 'assets/images/PngItem_4084529-min.png',
      price: 35),
  ProductModel(
    id: 101,
    name: 'Beef Tenderloin',
    image: 'assets/images/pngwing.com-min.png',
    price: 45,
  ),
];
List<Categories> categories = [
  Categories(name: 'Fruit', image: 'assets/images/pngwing.com (3)-min.png'),
  Categories(name: 'Veggie', image: 'assets/images/pngwing.com (2).png'),
  Categories(name: 'Spice', image: 'assets/images/pngwing.com (4).png'),
  Categories(name: 'Bread', image: 'assets/images/pngwing.com (6)-min.png'),
  Categories(name: 'Dairy', image: 'assets/images/pngwing.com (5).png'),
];

const List<String> bannerImages = [
  'assets/images/950.jpg',
  'assets/images/2147944277.jpg',
  'assets/images/2148655320.jpg',
  'assets/images/2148655320.jpg',
  'assets/images/2148655320.jpg',
];

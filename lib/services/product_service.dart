
import '../models/product.dart';
import 'dio_helper.dart';

class ProductService {
  static List<Product> products = [];

  Future<List<Product>> getData() async {
    List productsList = await DioHelper().getProducts(
      path: "https://dummyjson.com/products",
    );

    products = Product.convertToProducts(productsList);
    return products;
  }
}

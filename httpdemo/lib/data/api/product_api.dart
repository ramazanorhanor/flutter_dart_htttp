import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    return http.get(Uri(path:"http://localhost:3000/products"));
   // return http.get("http://10.0.2.2:3000/products"); // emuletor IP 
  }

  static Future getProductsByCategoryId(int categoryId) {
    return http.get( Uri(path:"http://localhost:3000/products?categoryId=$categoryId"));
  }
}

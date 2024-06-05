import 'package:http/http.dart' as http;

class CategoryApi{

  static Future getCategories(){

    return http.get(Uri(path:"http://localhost:3000/categories") );
  }

}
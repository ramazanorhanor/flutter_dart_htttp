import 'package:http/http.dart' as http;
import 'package:httpdemo/models/category.dart';

class CategoryApi {
  static Future getCategories() {
    //return http.get(Uri(path:"http://localhost:3000/categories") );
    //var httpUri=http.get( Uri(scheme: "http",host:"172.20.253.105",path:"/categories",port: 3000 ));
    final response= http.get(Uri.parse("http://localhost:3000/categories") );
    response.then((value) => { print(" hataKodu "+ value.statusCode.toString())});
    return response;
   /*
    final response =http.get(Uri.parse("http://172.20.253.105:3000/categories"));
    print(response.then((value) => value.statusCode));
    return response;
    */
  }
}

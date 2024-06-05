import 'package:flutter/material.dart';
import 'package:httpdemo/data/api/category_api.dart';
import 'package:httpdemo/models/category.dart';
import 'dart:convert';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories = List<Category>.empty();
  List<Widget> categoryWidgets = List<Widget>.empty();

  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "e ticaret ",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            )
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return ElevatedButton(
      child: Text(
        category.categoryName!,
      ),
      onPressed: () {},
    );
  }
}

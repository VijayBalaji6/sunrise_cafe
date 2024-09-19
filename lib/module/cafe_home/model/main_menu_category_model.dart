import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';

class MainMenuCategoryModel {
  String categoryName;
  List<CafeItemModel> categoryItems;
  MainMenuCategoryModel({
    required this.categoryName,
    required this.categoryItems,
  });
}

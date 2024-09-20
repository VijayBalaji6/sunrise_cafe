import 'package:sunrise_cafe/module/cafe_home/model/cafe_item_model.dart';
import 'package:sunrise_cafe/module/cafe_home/model/main_menu_category_model.dart';

final List<CafeItemModel> specialItems = [
  CafeItemModel(
    productId: 1,
    itemName: 'Chocolate 1',
    itemDescription: 'Sunset Acai Bowl',
    isVeg: true,
    itemImage: 'assets/home/special_menu/image_1.jpg',
    itemPrice: 10,
  ),
  CafeItemModel(
      productId: 2,
      itemName: 'Chocolate 2',
      itemDescription: 'Sunset Acai Bowl',
      isVeg: true,
      itemImage: 'assets/home/special_menu/image_2.jpg',
      itemPrice: 20),
  CafeItemModel(
      productId: 3,
      itemName: 'Chocolate 3',
      itemDescription: 'Sunset Acai Bowl',
      isVeg: true,
      itemImage: 'assets/home/special_menu/image_1.jpg',
      itemPrice: 20),
  CafeItemModel(
      productId: 4,
      itemName: 'Chocolate 4',
      itemDescription: 'Sunset Acai Bowl',
      isVeg: true,
      itemImage: 'assets/home/special_menu/image_2.jpg',
      itemPrice: 20),
];

final List<MainMenuCategoryModel> mainMenuItemCategories = [
  MainMenuCategoryModel(categoryName: 'Acai bowls', categoryItems: [
    CafeItemModel(
        productId: 5,
        itemName: 'Chocolate Bowl 1',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_1.jpg',
        itemPrice: 10),
    CafeItemModel(
        productId: 6,
        itemName: 'Chocolate Bowl 2',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_2.jpg',
        itemPrice: 20),
    CafeItemModel(
        productId: 6,
        itemName: 'Chocolate Bowl 3',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_2.jpg',
        itemPrice: 20),
  ]),
  MainMenuCategoryModel(categoryName: 'Acai bowls', categoryItems: [
    CafeItemModel(
        productId: 7,
        itemName: 'Chocolate Bowl 4',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_1.jpg',
        itemPrice: 10),
    CafeItemModel(
        productId: 8,
        itemName: 'Chocolate Bowl 5',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_2.jpg',
        itemPrice: 20),
  ]),
  MainMenuCategoryModel(categoryName: 'Acai bowls', categoryItems: [
    CafeItemModel(
        productId: 9,
        itemName: 'Chocolate Bowl 6',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_1.jpg',
        itemPrice: 10),
    CafeItemModel(
        productId: 10,
        itemName: 'Chocolate Bowl 7',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_2.jpg',
        itemPrice: 20),
  ]),
  MainMenuCategoryModel(categoryName: 'Acai bowls', categoryItems: [
    CafeItemModel(
        productId: 11,
        itemName: 'Chocolate Bowl 8',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_1.jpg',
        itemPrice: 10),
    CafeItemModel(
        productId: 12,
        itemName: 'Chocolate Bowl 9',
        itemDescription: 'Sunset Acai Bowl',
        isVeg: true,
        itemImage: 'assets/home/special_menu/image_2.jpg',
        itemPrice: 20),
  ])
];

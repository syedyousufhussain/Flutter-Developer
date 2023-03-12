import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/cart_modle.dart';
import '../models/categories_modle.dart';
import '../models/food_categories_modle.dart';
import '../models/food_modle.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModle> fingerfishList = [];
  CategoriesModle ?fingerfishModle;
  Future<void> getFingerfishCategory() async {
    List<CategoriesModle> newfingerfishList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('rdWS9VruXKiVKhZAKOh6')
        .collection('Finger Fish')
        .get();
    querySnapshot.docs.forEach((element) {
      fingerfishModle = CategoriesModle(
        // image: element.data()['image'],
        image: (element.data()as dynamic)['image'],
        // name: element.data()['name'],
        name: (element.data()as dynamic)['name'],
      );
      newfingerfishList.add(fingerfishModle!);
      fingerfishList = newfingerfishList;
    });
    notifyListeners();
  }

  get throwfingerfishList {
    return fingerfishList;
  }

  /////////////////// 2nd category ////////////////
  List<CategoriesModle> recipeList = [];
  CategoriesModle ?recipeModle;
  Future<void> getRecipeCategory() async {
    List<CategoriesModle> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('rdWS9VruXKiVKhZAKOh6')
        .collection('Sea Food Recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModle = CategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
      );
      newRecipeList.add(recipeModle!);
      recipeList = newRecipeList;
    });
    notifyListeners();
  }

  get throwRecipeList {
    return recipeList;
  }

  /////////////// 3nd Category///////////////////////

  List<CategoriesModle> fastFoodList = [];
  CategoriesModle ?fastFoodModle;
  Future<void> getfastFoodCategory() async {
    List<CategoriesModle> newfastFoodList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('rdWS9VruXKiVKhZAKOh6')
        .collection('Sea Fast Foods')
        .get();
    querySnapshot.docs.forEach((element) {
      fastFoodModle = CategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
      );
      newfastFoodList.add(fastFoodModle!);
      fastFoodList = newfastFoodList;
    });
    notifyListeners();
  }

  get throwfastFoodList {
    return fastFoodList;
  }

/////////////////4th category /////////////

  List<CategoriesModle> drinkList = [];
  CategoriesModle ?drinkModle;
  Future<void> getDrinkCategory() async {
    List<CategoriesModle> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('rdWS9VruXKiVKhZAKOh6')
        .collection('Sea Protein Shakes')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModle = CategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
      );
      newDrinkList.add(drinkModle!);
      drinkList = newDrinkList;
    });
    notifyListeners();
  }

  get throwDrinkList {
    return drinkList;
  }

  /////////////////////  Single Food Item     //////////////////////////

  List<FoodModle> foodModleList = [];
  FoodModle ?foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach(
      (element) {
        foodModle = FoodModle(
          name: (element.data()as dynamic)['name'],
          image: (element.data()as dynamic)['image'],
          price: (element.data()as dynamic)['price'],
        );
        newSingleFoodList.add(foodModle!);
      },
    );

    foodModleList = newSingleFoodList;
    notifyListeners();
  }

  get throwFoodModleList {
    return foodModleList;
  }

  ///////////////burger categories list//////////
  List<FoodCategoriesModle> burgerCategoriesList = [];
  FoodCategoriesModle ?burgerCategoriesModle;
  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModle> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = FoodCategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
        price: (element.data()as dynamic)['price'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModle!);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  ///////////////Recipe categories list//////////
  List<FoodCategoriesModle> recipeCategoriesList = [];
  FoodCategoriesModle ?recipeCategoriesModle;
  Future<void> getrecipeCategoriesList() async {
    List<FoodCategoriesModle> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModle = FoodCategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
        price: (element.data()as dynamic)['price'],
      );
      newrecipeCategoriesList.add(recipeCategoriesModle!);
      recipeCategoriesList = newrecipeCategoriesList;
    });
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }

  ///////////////Pizza categories list//////////
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  FoodCategoriesModle ?pizzaCategoriesModle;
  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = FoodCategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
        price: (element.data()as dynamic)['price'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle!);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  ///////////////Drink categories list//////////
  List<FoodCategoriesModle> drinkCategoriesList = [];
  FoodCategoriesModle ?drinkCategoriesModle;
  Future<void> getDrinkCategoriesList() async {
    List<FoodCategoriesModle> newDrinkCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('8Dtfnhwbi1cDkCrX02rA')
        .collection('drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkCategoriesModle = FoodCategoriesModle(
        image: (element.data()as dynamic)['image'],
        name: (element.data()as dynamic)['name'],
        price: (element.data()as dynamic)['price'],
      );
      newDrinkCategoriesList.add(drinkCategoriesModle!);
      drinkCategoriesList = newDrinkCategoriesList;
    });
  }

  get throwDrinkCategoriesList {
    return drinkCategoriesList;
  }

/////////////add to cart ////////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  CartModle ?cartModle;
  void addToCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle!);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }
 int ?deleteIndex;
 void getDeleteIndex(int index){
     deleteIndex=index;
 }
 void delete(){
   cartList.removeAt(deleteIndex!);
   notifyListeners();
 }
}

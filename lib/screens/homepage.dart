import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/categories_modle.dart';
import '../models/food_categories_modle.dart';
import '../models/food_modle.dart';
import '../provider/my_provider.dart';
import 'cart_page.dart';
import 'categories.dart';
import 'detail_page.dart';
import 'widgets/bottom_Contianer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {

FirebaseAuth auth = FirebaseAuth.instance;
  

  @override
  
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1st
  List<CategoriesModle> fingerfishList = [];

  ///2nd
  List<CategoriesModle> recipeList = [];
  //3rd
  List<CategoriesModle> fastFoodList = [];
  //4th
  List<CategoriesModle> drinkList = [];

  List<FoodModle> singleFoodList = [];

  List<FoodCategoriesModle> fingerfishCategoriesList = [];
  List<FoodCategoriesModle> recipeCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];

  Widget categoriesContainer(
      {required void Function() onTap,
      required String image,
      required String name}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  ////1st
  Widget fingerfish() {
    return Row(
      children: fingerfishList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: fingerfishCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

////2nd
  Widget seaFoodrecipe() {
    return Row(
      children: recipeList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: recipeCategoriesList),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  //3rd
  Widget seaFastfoods() {
    return Row(
      children: fastFoodList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: pizzaCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  /////4th
  Widget drink() {
    return Row(
      children: drinkList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: drinkCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    // 1st
    provider.getFingerfishCategory();
    fingerfishList = provider.throwfingerfishList;
    //2nd
    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;
    //3rd
    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;
    // 4th
    provider.getfastFoodCategory();
    fastFoodList = provider.throwfastFoodList;
    //////////////single food list/////////
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;
    provider.getFingerfishCategory();
    fingerfishCategoriesList = provider.throwBurgerCategoriesList;
    provider.getrecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;
    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;
    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.throwDrinkCategoriesList;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/background.jpg'),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/fishlogo.jpg'),
                  ),
                  accountName: Text("Fishing Jet"),
                  accountEmail: Text("fishingjet@gmail.com"),
                ),
                drawerItem(icon: Icons.person, name: "Profile"),
                // drawerItem(icon: Icons.add_shopping_cart, name: "Cart"), 
                ElevatedButton.icon(
                  onPressed: ()async{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),);
                    }, 
                    icon: const Icon(Icons.add_shopping_cart),  //icon data for elevated button
                    label: const Text("Cart Page"),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.transparent //elevated btton background color
                      ), //label text 
                    ),
                drawerItem(icon: Icons.shop, name: "Order"),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Text(
                    "Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Text(
                //   "Comunicate",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //   ),
                // ),
                drawerItem(icon: Icons.lock, name: "Change"),
                ElevatedButton.icon(
                  onPressed: ()async{
                    await FirebaseAuth.instance.signOut();
                    print("You pressed Icon Elevated Button");
                    }, 
                    icon: const Icon(Icons.logout_outlined),  //icon data for elevated button
                    label: const Text("Log out"),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 20),
                         backgroundColor: Colors.transparent //elevated btton background color
                      ), //label text 
                    ),
                // drawerItem(icon: Icons.exit_to_app, name: "Log Out"),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/fishlogo.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                fingerfish(),
                seaFoodrecipe(),
                seaFastfoods(),
                drink(),
                // categoriesContainer(image: 'images/1.png', name: "All"),
                // categoriesContainer(image: 'images/2.png', name: "Burger"),
                // categoriesContainer(image: 'images/3.png', name: "Recipe"),
                // categoriesContainer(image: 'images/4.png', name: "Pizza"),
                // categoriesContainer(image: 'images/5.png', name: "Drink"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 510,
              child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: singleFoodList
                      .map(
                        (e) => BottomContainer(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  image: e.image,
                                  name: e.name,
                                  price: e.price,
                                ),
                              ),
                            );
                          },
                          image: e.image,
                          price: e.price,
                          name: e.name,
                        ),
                      )
                      .toList()
                  // children: [
                  //   // bottonContainer(
                  //   //   image: 'images/2.png',
                  //   //   name: 'burger1',
                  //   //   price: 12,
                  //   // ),
                  //   // bottonContainer(
                  //   //   image: 'images/2.png',
                  //   //   name: 'burger1',
                  //   //   price: 12,
                  //   // ),
                  //   // bottonContainer(
                  //   //   image: 'images/2.png',
                  //   //   name: 'burger1',
                  //   //   price: 12,
                  //   // ),
                  //   // bottonContainer(
                  //   //   image: 'images/2.png',
                  //   //   name: 'burger1',
                  //   //   price: 12,
                  //   // ),
                  // ],
                  ),
            ),
          )
        ],
      ),
    );
  }
}
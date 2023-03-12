import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';
import 'checkout_page.dart';
import 'homepage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required void Function() onTap,
    required int quantity,
  }) {
    return Row(
      children: [
        Container(
          width: 170,
          height: 170,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Thanks for shopping at FishCorner Enjoy your meal with deliciousness.",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "$price PKR/kg",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "$quantity",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: onTap,
            )
          ],
        )),
      ],
    );
  }
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$total PKR/kg",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            ElevatedButton.icon(
                  
                  onPressed: ()async{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const check_Out()),);
                    }, 
                    icon: const Icon(Icons.delivery_dining_sharp),  //icon data for elevated button
                    label: const Text("Check Out"), 
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.transparent //elevated btton background color
                      ), //label text 
                    ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return cartItem(
            onTap: (){
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}

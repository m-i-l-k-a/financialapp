import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
   int _selectedItemIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.card_giftcard, 1),
          buildNavBarItem(Icons.camera, 2),
          buildNavBarItem(Icons.pie_chart, 3),
          buildNavBarItem(Icons.person, 4),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            color: const Color(0XFF00B686),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Text(
                      "Transfer",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildExpenseMethod(Icons.phone, "Mobile", true),
                    buildExpenseMethod(Icons.photo_camera, "Qr Code", false),
                    buildExpenseMethod(Icons.card_membership, "Card", false),
                    buildExpenseMethod(Icons.ev_station, "Utilities", false),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              height: MediaQuery.of(context).size.height - 230,
              top: 170,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildRecentContact(
                                "Catherine",
                                "assets/images/img.png",
                              ),
                              buildRecentContact(
                                "James",
                                "assets/images/img_2.png",
                              ),
                              buildRecentContact(
                                "Dad",
                                "assets/images/img_3.png",
                              ),
                              buildRecentContact(
                                "Jane",
                                "assets/images/img_4.png",
                              ),
                              buildRecentContact(
                                "Winter",
                                "assets/images/img_5.png",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                        children: [
                          const Text(
                            "Contacts",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Search",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          buildContactRow(
                            "Winter Maru","+2546766000","assets/images/img_1.png",),
                          buildContactRow(
                            "Omondi Kitu","+2546766678","assets/images/img_5.png",),
                          buildContactRow(
                            "Mewa Doti","+2546766678","assets/images/img_4.png",),
                          buildContactRow(
                            "abuju Set","+2546767865","assets/images/img_3.png",),
                          buildContactRow(
                            "Wendo Milk","+254676888","assets/images/img_2.png",),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Container buildContactRow(String name, String phone, String images) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               CircleAvatar(
                backgroundImage: AssetImage(images),
                radius: 25,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children:  [
                      const Icon(
                        Icons.phone,
                        size: 16,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        phone,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Container buildRecentContact(String name, images) {
    return Container(
      margin: const EdgeInsets.only(
        right: 30,
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(images),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Container buildExpenseMethod(IconData icon, String title, bool isActive) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0XFF00B686) : Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isActive ? const Color(0XFF00B686) : Colors.white,
            ),
          )
        ],
      ),
    );

  }
  GestureDetector buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 60,
        decoration:index== _selectedItemIndex ?  BoxDecoration(
          border: const Border(bottom: BorderSide(width: 4,color: Colors.green)),
          gradient: LinearGradient(colors: [ Colors.green.withOpacity(0.3),
            Colors.green.withOpacity(0.016)
          ],
              begin: Alignment.bottomCenter,end: Alignment.topCenter
          ),




        ):

        BoxDecoration(

        ),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ?Color(0XFF00B868):Colors.grey,
        ),
      ),
    );
  }

}

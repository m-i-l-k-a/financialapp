
import 'package:financialapp/transfer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getApiData() async {
    var url= Uri.parse("http://196.11.150.234:8888/walletmobileapi/rest/wallet/fbns/customer/fetchotp/2348639906665/%7Bsecurity%7D"
    );
    Response response = await get(url);
    print(response);
    print(response.statusCode);
    if(response.statusCode == 200){
      print('success');

    }else{
      print('oops ');
    }

  }
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
      body: Center(
        
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0XFF128C7E),
                    Color(0XFF128C7E),
                  ])),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                              "Available Balance",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color(0XFF128C7E),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 8,
                                    spreadRadius: 3,
                                  )
                                ],
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  40.0,
                                ),
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/img.png"),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Milka Summers",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.camera_front,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                          text: "\$234",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: ".50",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ))
                                          ]),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    color: Colors.grey,
                    child: ListView(
                      padding: const EdgeInsets.only(top: 75),
                      children: [
                        const Text(
                          "Activity",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildActivityButton(Icons.card_membership, "My Card",
                                Colors.blue.withOpacity(0.2), const Color(0XFF01579B)),
                            buildActivityButton(
                                Icons.transfer_within_a_station,
                                "Transfer",
                                Colors.cyanAccent.withOpacity(0.2),
                                const Color(0XFF0097A7)),
                            buildActivityButton(
                                Icons.pie_chart,
                                "Statistics",
                                const Color(0XFFD7CCC8).withOpacity(0.4),
                                const Color(0XFF9499B7)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildCategoryCard(
                          Icons.fastfood,
                          "Food",
                          120,
                          20,
                        ),
                        buildCategoryCard(
                          Icons.flash_on,
                          "Utilies",
                          130,
                          40,
                        ),
                        buildCategoryCard(
                          Icons.fastfood,
                          "Food",
                          154,
                          23,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 185,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                width: MediaQuery.of(context).size.width * 0.85,
                height: 160,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: const Offset(0, 10),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Income",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_upward,
                                  color: Color(0XFF00838F),
                                )
                              ],
                            ),
                            const Text(
                              "\$2300.50",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Expenses",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Color(0XFF00838F),
                                )
                              ],
                            ),
                            const Text(
                              "\$2598.60",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "You spent \$1400 this month",
                      style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Let see the cost statitics for this period",
                      style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 20,

                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){return const TransferPage();

                          }));
                        },
                        child: const Text(
                          "Tell me more",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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

            const BoxDecoration(

            ),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ?const Color(0XFF00B868):Colors.grey,
        ),
      ),
    );
  }

  Container buildCategoryCard(
      IconData icon, String title, int amount, int percentage) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: 85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: const Color(0XFF00B686),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "\$$amount",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "($percentage%)",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0XFF00B686),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildActivityButton(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
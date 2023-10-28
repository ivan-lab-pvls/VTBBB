import 'package:banking_app/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:banking_app/service/incomes_db.dart';

class UserCart extends StatefulWidget {
  const UserCart({Key? key}) : super(key: key);

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  final incomesBox = Hive.box(incomes);
  final IncomesDB db = IncomesDB();

  Future<double> calculateTotalPrice() async {
    return db.calculateTotalPrice();
  }

  @override
  void initState() {
    super.initState();
    if (incomesBox.get("IncomesList") == null) {
      db.defaultData();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage("assets/images/card_background_img.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Balance",
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.012,
          ),
          FutureBuilder<double>(
            future: calculateTotalPrice(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Text(
                  '\$ ${snapshot.data.toString()}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Spacer(),
          const Text(
            "5413 5698 3581 0134",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

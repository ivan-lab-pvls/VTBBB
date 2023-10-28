import 'package:banking_app/main.dart';
import 'package:banking_app/presentation/screens/add_income_page.dart';
import 'package:banking_app/service/incomes_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}


class _IncomePageState extends State<IncomePage> {
  
  final incomesBox = Hive.box(incomes);
  final IncomesDB db = IncomesDB();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController percentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (incomesBox.get("IncomesList") == null) {
      db.defaultData();
    } else {
      db.loadData();
    }
  }

  void saveIncome() {
    setState(() {
      if (priceCtrl.text.isEmpty ||
          descCtrl.text.isEmpty ||
          percentCtrl.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text("Fields shouldn't be empty")),
            backgroundColor: const Color.fromARGB(255, 157, 65, 58),
          ),
        );
        return;
      } else {
        db.incomesList.add([priceCtrl.text.trim(), descCtrl.text.trim()]);
        priceCtrl.clear();
        descCtrl.clear();
        percentCtrl.clear();
        Navigator.pop(context);
      }
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: MediaQuery.sizeOf(context).height * .08,
        title: const Text(
          "INCOME",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: db.incomesList.isEmpty
            ? Column(
                children: [
                  Spacer(),
                  Text(
                    "You have not any profit items",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF171B34),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .015),
                  Text(
                    "Tap on 'Add income' to button",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: .5,
                      color: Colors.black.withOpacity(.4),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF06BCFE),
                      minimumSize: Size(
                        MediaQuery.sizeOf(context).width * .6,
                        MediaQuery.sizeOf(context).height * .057,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (builder) => AddIncomePage(
                          onTap: saveIncome,
                          priceCtrl: priceCtrl,
                          descCtrl: descCtrl,
                          percentCtrl: percentCtrl,
                        ),
                      ),
                    ),
                    child: Text(
                      "Add income",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              )
            : ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: db.incomesList.length,
                itemBuilder: (context, index) {
                  final price = db.incomesList[index][0];
                  final description = db.incomesList[index][1];
                  return ListTile(
                    title: Text(
                      '$price\$',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF171B34),
                      ),
                    ),
                    subtitle: Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: .5,
                        color: Colors.black.withOpacity(.4),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: db.incomesList.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (builder) => AddIncomePage(
                    onTap: saveIncome,
                    priceCtrl: priceCtrl,
                    descCtrl: descCtrl,
                    percentCtrl: percentCtrl,
                  ),
                ),
              ),
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}

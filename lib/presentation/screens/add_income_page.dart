import 'package:flutter/material.dart';

class AddIncomePage extends StatefulWidget {
  final void Function() onTap;
  final TextEditingController priceCtrl;
  final TextEditingController descCtrl;
  final TextEditingController percentCtrl;
  const AddIncomePage({super.key, required this.onTap, required this.priceCtrl, required this.descCtrl, required this.percentCtrl});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 55,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFFBDBDBD),
            size: 40,
          ),
        ),
        toolbarHeight: MediaQuery.sizeOf(context).height * .08,
        title: const Text(
          "Add Income",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: widget.priceCtrl,
                onSubmitted: (text) {
                  FocusScope.of(context).nextFocus();
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                autofocus: true,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF003C84),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  hintText: "Income amount",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 103, 102, 102),
                    letterSpacing: .5,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: widget.percentCtrl,
                onSubmitted: (text) {
                  FocusScope.of(context).nextFocus();
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                autofocus: true,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF003C84),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  hintText: "Monthly percent",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 103, 102, 102),
                    letterSpacing: .5,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: widget.descCtrl,
                onSubmitted: (text) {
                  FocusScope.of(context).unfocus();
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF003C84),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  hintText: "Income description",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 103, 102, 102),
                    letterSpacing: .5,
                  ),
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
                onPressed: widget.onTap,
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
          ),
        ),
      ),
    );
  }
}

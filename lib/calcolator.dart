import 'package:calcolator/calc_btn.dart';
import 'package:flutter/material.dart';

class Calcolator extends StatefulWidget {
  static const String routeName = "Calcolator";

  @override
  State<Calcolator> createState() => _CalcolatorState();
}

class _CalcolatorState extends State<Calcolator> {
  String res = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Calculator",
              style: TextStyle(
                fontSize: 27,
              )),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(res,
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(
                    num: "9",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "8",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "7",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "/",
                    onClick: operations,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(
                    num: "6",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "5",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "4",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "*",
                    onClick: operations,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(
                    num: "3",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "2",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "1",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "-",
                    onClick: operations,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(
                    num: ".",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "0",
                    onClick: clickBtn,
                  ),
                  CalcBtn(
                    num: "=",
                    onClick: equal,
                  ),
                  CalcBtn(
                    num: "+",
                    onClick: operations,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  clickBtn(num) {
    if(opr=='='){
      res="";
      lhs ="";
      opr ="";
    }
    res += num;
    setState(() {});
  }

  String lhs = '';
  String rhs = '';
  String opr = '';

  equal(equalOperation) {
    res = Calc(lhs, res, opr);
    opr=equalOperation;
    setState(() {

    });
  }

  String Calc(String lhs, String rhs, String opr) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);

    if (opr == "+") {
      double out = LHS + RHS;
      return out.toString();
    } else if (opr == "-") {
      double out = LHS - RHS;
      return out.toString();
    } else if (opr == "*") {
      double out = LHS * RHS;
      return out.toString();
    } else if (opr == "/") {
      double out = LHS / RHS;
      return out.toString();
    }

    return "";
  }

  operations(operation) {
    if (opr.isEmpty) {
      lhs = res;
    } else {
      lhs = Calc(lhs, res, opr);
    }
    opr = operation;
    res = "";
    print(lhs);
    setState(() {});
  }
}

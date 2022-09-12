import 'dart:io';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);
  //Color purple=Colors.purple.shade200;
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double _billAmount = 0;
  var _splitAmount = 1;
  //double _tipAmount = 0;
  //double _billPerperson=0.0;
  double _percentTips = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.purple.shade50),
                      
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Column(
                      
                      children: [
                        Text(
                          "Total Per Person",
                          style: TextStyle(color: Colors.purple.shade200,fontSize: 18.0),
                        ),
                        Text("${totalPerPerson(_billAmount, _splitAmount, _percentTips)}",style: TextStyle(fontSize: 28),)
                      ],
                    ),
                  ),
                  ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter an amount',
                                  hintStyle: TextStyle(
                                    color: Colors.purple.shade200,
                                    fontWeight: FontWeight.normal,
                                  )),
                              onChanged: (String value) {
                                _billAmount = double.parse(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Split",
                              style: TextStyle(color: Colors.purple.shade200)),
                          Row(children: [
                            InkWell(
                              child: Container(
                                height: 20,
                                width: 20,
                                color: Colors.purple.shade100,
                                child: Center(
                                    child: Text("-",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.purple.shade400))),
                              ),
                              onTap: () {
                                setState(() {
                                  if (_splitAmount > 1) {
                                    _splitAmount--;
                                  } else {
                                    _splitAmount = 1;
                                  }
                                });
                              },
                            ),
                            Container(
                                height: 20,
                                width: 20,
                                child: Center(
                                    child: Text(_splitAmount.toString()))),
                            InkWell(
                              child: Container(
                                height: 20,
                                width: 20,
                                color: Colors.purple.shade100,
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple.shade400),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _splitAmount++;
                                });
                              },
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tips",
                            style: TextStyle(color: Colors.purple.shade200),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:100.0),
                            child: Text("${tipsAmount(_billAmount,_percentTips).toStringAsFixed(2)}",
                                style:
                                    TextStyle(color: Colors.purple.shade400)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("${_percentTips.toStringAsFixed(0)}%",style: TextStyle(fontSize: 18)),
                      Slider(
                          thumbColor: Colors.black,
                          
                          divisions: 20,
                          //label: _percentTips.round().toString(),
                          min: 0,
                          max: 100,
                          value: _percentTips,
                          onChanged: (value) {
                            setState(() {
                              _percentTips = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  tipsAmount(double billAmount,double percentTips){
    double totalTip=(billAmount*percentTips)/100;
  return totalTip;
}
totalPerPerson(double billAmount,int splitAmount,double percentTips){
  double billPerPerson=(billAmount+tipsAmount(billAmount, percentTips))/splitAmount;
  return billPerPerson.toStringAsFixed(2);
}
}
//tipsAmount(){
  //return ((_billAmount*_percentTips)/100);
//}
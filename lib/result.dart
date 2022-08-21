import 'dart:ui';

import 'package:flutter/material.dart';
import 'homepage.dart';

class ResultPage extends StatefulWidget {
  final String result;
  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 1, 31),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("BMI CALCULATOR"),
        elevation: 1,
      ),
      body: Column(
        children: [
          const Text(
            'Your Result',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Container(
            // height: 300,
             width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(104, 65, 61, 88),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                 Text(
                  
                  status(),
                  style: const TextStyle(
                    
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.result,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 100,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  determine(),textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 40,
            child: Container(
              height: 100,
              width: 00,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 3, 105),
                  borderRadius: BorderRadius.circular(0)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Homepage()));
                  // if (_formkey.currentState!.validate()) {
                  //   setState(() {});
                  //   func();
                },
                child: const Text(
                  'RE-CALCULAT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String determine() {
    if (double.parse(widget.result) < 18.5) {
      return 'Your BMI shows you are under weight. Try to add more weight';
    }  else if (double.parse(widget.result) > 18.5 && double.parse(widget.result) < 25.0)  {
      return '  Good!!!. Your BMI shows that you have a normal weight. Countinue the excercise';
    }else if( double.parse(widget.result) > 24.9 && double.parse(widget.result) < 30) {
        return 'Your BMI shows you are Over weight. Try to loss more weight';
    } else if(  double.parse(widget.result) > 29.9){
          return 'Your BMI shows you are OBESE. Try to loss weight.Do more excercise';
    }else{
      return '';
    }
  }

   String status() {
    if (double.parse(widget.result)< 18.5 ) {
      return 'Underweight';
    }  else if (double.parse(widget.result) > 18.5  && double.parse(widget.result) < 25.0 )  {
      return '  Normal or Healthy Weight';
    }else if( double.parse(widget.result) > 24.9 && double.parse(widget.result) < 30) {
        return 'Overweight';
    } else if(  double.parse(widget.result) > 29.9){
          return 'Obese';
    }else{
      return '';
    }
  }
}

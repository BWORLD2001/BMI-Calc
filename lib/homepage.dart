import 'package:flutter/material.dart';
import 'package:textbmi/result.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController fnum = TextEditingController();
  TextEditingController snum = TextEditingController();
  bool isSwitched = false;
  bool isSwitch = false;

  final _formkey = GlobalKey<FormState>();

  int _counter = 0;
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      double val = double.parse(snum.text);
      val = val + 1;

      snum = TextEditingController(text: '$val');
    });
  }

  void _incrementCount() {
    setState(() {
      double val = double.parse(fnum.text);
      if (val > 0.0 && val > 0) {
        val = val - 1;
        fnum = TextEditingController(text: '$val');
      }
    });
  }

  void _incrementCounting() {
    setState(() {
      double val = double.parse(fnum.text);
      val = val + 1;
      fnum = TextEditingController(text: '$val');
    });
  }

  void _incrementCoun() {
    setState(() {
      double val = double.parse(snum.text);
      if (val > 0.0 && val > 0) {
        val = val - 1;
        snum = TextEditingController(text: '$val');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_3),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        height: 185,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 240, 239, 239),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'H (height im meter)',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              controller: fnum,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                              validator: (v) {
                                if (v == '0' || v == '0.0') {
                                  return 'value cannot be zero';
                                } else if (v!.isEmpty) {
                                  return 'Kindly enter your hheight';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                isDense: true,
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: _incrementCount,
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color.fromARGB(255, 100, 20, 204),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _incrementCounting,
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Color.fromARGB(255, 100, 20, 204),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        height: 185,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 240, 239, 239),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'M (mass is KG)',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              maxLength: 4,
                              controller: snum,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                              validator: (v) {
                                if (v == '0' || v == "0.0") {
                                  return 'value cannot be zero';
                                } else if (v!.isEmpty) {
                                  return 'Kindly enter your width';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                isDense: true,
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),

                            // Text(
                            //   '$_counter',
                            //   style: const TextStyle(
                            //       fontSize: 50, fontWeight: FontWeight.w900),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: _incrementCoun,
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color.fromARGB(255, 100, 20, 204),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _incrementCounter,
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Color.fromARGB(255, 100, 20, 204),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 212, 210, 210))
                      ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 210, 210, 212))
                                  ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('cm'),
                                  Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            isSwitched = value;
                                            print(isSwitched);
                                          },
                                        );
                                      },
                                      activeTrackColor: const Color.fromARGB(
                                          255, 204, 167, 253),
                                      activeColor: const Color.fromARGB(
                                          255, 100, 20, 204)),
                                  const Text('Ft')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 9
                      ),
                      const Text(
                        'Height',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 234, 250),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  '4',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                Icon(Icons.arrow_circle_down),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 235, 247),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  '4\"',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                Icon(Icons.arrow_circle_down),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 233, 252),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20
                      ),
                      const Text(
                        "Gender",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'I\'m',
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.w800),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Female',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Switch(
                                  value: isSwitch,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        isSwitch = value;
                                        print(isSwitch);
                                      },
                                    );
                                  },
                                  activeTrackColor:
                                      const Color.fromARGB(255, 204, 167, 253),
                                  activeColor:
                                      const Color.fromARGB(255, 100, 20, 204)),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: Container(
                    height: 100,
                    width: 00,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 100, 20, 204),
                        borderRadius: BorderRadius.circular(25)),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultPage(result: func()),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String func() {
    double b = double.parse(snum.text);
    var d = double.parse(fnum.text) * double.parse(fnum.text);
    var c = b / d;
    return '$c'.length > 5 ? '$c'.substring(0, 5) : '$c';
  }

  @override
  void initState() {
    fnum = TextEditingController(text: '0');
    snum = TextEditingController(text: '0');
    super.initState();
  }

  @override
  void dispose() {
    fnum.dispose();
    snum.dispose();
    super.dispose();
  }
}

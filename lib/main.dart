import 'package:bmi_calculator/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var wtCtrl=TextEditingController();
var ftCtrl=TextEditingController();
var inCtrl=TextEditingController();
var result="";
var bgcolor=Colors.teal.shade50;
var resultColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Center(
          child: Text("BMI Calculator",strutStyle: StrutStyle(
            fontWeight: FontWeight.bold,
          ) ,),
        ),
      ),
      body:  Container(
          color: Colors.teal.shade100,
          child: Center(
            child: Card(
              color: Colors.black12,
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.0)
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    color: bgcolor,
                    borderRadius: BorderRadius.circular(21)
                  ),
                  width: 320,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("BMI", style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.w700,
                      ),),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: wtCtrl,
                          decoration: InputDecoration(
                            label: const Text("Enter your weight"),
                            prefixIcon: const Icon(Icons.line_weight),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: ftCtrl,
                          decoration: InputDecoration(
                            label: const Text("Enter your height feets"),
                            prefixIcon: const Icon(Icons.height),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: inCtrl,
                          decoration: InputDecoration(
                            label: const Text("Enter your height Inches"),
                            prefixIcon: const Icon(Icons.height_sharp),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        var weight=wtCtrl.text.toString();
                        var feet=ftCtrl.text.toString();
                        var inches=inCtrl.text.toString();

                        if(weight!="" && feet!="" && inches!=""){
                          var wt=int.parse(weight);
                          var ft=int.parse(feet);
                          var In= int.parse(inches);

                          var tIn= (ft*12)+In;
                          var tcm=tIn*2.54;
                          var tM =tcm/100;
                          var bmi=wt/(tM*tM);

                          String msg;
                          if(bmi<18.5){
                            msg="You are underweight";
                            bgcolor=Colors.yellow.shade100;
                          }else if(bmi<=25){
                            msg="You wight is normal";
                            bgcolor=Colors.green.shade200;
                          }else if(bmi<29){
                            msg="You are overweight";
                            bgcolor=Colors.red.shade300;
                          }else {
                            msg="obesity";
                            bgcolor=Colors.red.shade300;
                          }
                          setState(() {
                            result="$msg\nYour BMI is ${bmi.toStringAsFixed(2)}";
                          });
                        }else{
                          result="Please fill all the required form ";
                          setState(() {
                            resultColor =Colors.red;
                          });
                        }

                      }, child: const Text("Calculate"),style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.teal.shade100,
                      ),),
                      const SizedBox(height: 10,),
                      Text(result ,style: const TextStyle(
                        fontSize:16,
                        fontWeight: FontWeight.w700
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}

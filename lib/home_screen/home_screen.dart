import 'package:calculator_app/app_color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operator = "";
  var hideInput = false;
  var outputSize = 30.0;

  onButtonClick(value){
    if(value == "AC"){
      input= "";
      output= "";
    }else if(value == "<"){
      if(input.isNotEmpty){
        input = input.substring(0,input.length -1);
      }

    }else if(value == "="){
      if(input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression exception = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = exception.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith(".0")){
          output = output.substring(0,output.length -2);
        }
        input = output;
        hideInput = true;
        outputSize = 30;
      }
    }else{
      input = input + value;
      hideInput = false;
      outputSize = 30;
    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
            padding:const EdgeInsets.all(10),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(hideInput?"":input,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 30,color: Colors.white),),
              const SizedBox(height: 20,),
              Text(output,style: TextStyle(fontWeight: FontWeight.w300,fontSize: outputSize,color: Colors.white.withOpacity(0.7)),),
              const SizedBox(height: 40,),
            ],
          ),),
          ),
          Row(
            children: [
              AppButton(name: "AC", textColor: AppColors.orangeColor,),
              AppButton(name: "<", textColor: AppColors.orangeColor,),
              AppButton(name: "", textColor: AppColors.orangeColor,),
              AppButton(name: "/",textColor: AppColors.orangeColor,),
            ],
          ),

          Row(
            children: [
              AppButton(name: "7", ),
              AppButton(name: "8", ),
              AppButton(name: "9", ),
              AppButton(name: "x",textColor: AppColors.orangeColor,),
            ],
          ),
          Row(
            children: [
              AppButton(name: "4",),
              AppButton(name: "5", ),
              AppButton(name: "6", ),
              AppButton(name: "-", textColor: AppColors.orangeColor,),
            ],
          ),
          Row(
            children: [
              AppButton(name: "1", ),
              AppButton(name: "2", ),
              AppButton(name: "3", ),
              AppButton(name: "+",textColor: AppColors.orangeColor,),
            ],
          ),
          Row(
            children: [
              AppButton(name: "%", textColor: AppColors.orangeColor,),
              AppButton(name: "0", ),
              AppButton(name: ".",textColor: AppColors.orangeColor,),
              AppButton(name: "=", bgColor: AppColors.orangeColor,),
            ],
          ),

        ],
      ),
    ));
  }
 Widget AppButton({name,bgColor= Colors.white10,textColor = Colors.white}){
   return Expanded(
     child: GestureDetector(
       onTap: ()=>onButtonClick(name),
       child: Container(
         margin: const EdgeInsets.all(08),
         padding: const EdgeInsets.all(10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: bgColor,
         ),
         child: Center(
           child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: textColor),),
         ),
       ),
     ),
   );
 }

}

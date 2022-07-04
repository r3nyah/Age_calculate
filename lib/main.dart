import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool check = false;
  late int d,m,y;
  String day1=" ";
  String month1="";
  String year1="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Age Calculate',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            RaisedButton(
              child: Text(
                '-Choose Date-',
              ),
              onPressed: (){
                f1();
              },
            ),
            Text(
              year1+' '+month1+' '+day1,
              style: TextStyle(
                fontSize: 28,
                color: Colors.blueAccent
              ),
            ),
            Image.network(
              check?
              'https://pbs.twimg.com/media/E31vLUKVcAQqP_J?format=jpg&name=small'
                  :
              'https://pbs.twimg.com/media/E31vLsnVEAcp8_c?format=jpg&name=small',
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
    );
  }

  Future f1() async{
//    DateTime?date1 = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1945),
//       lastDate: DateTime(2023),
//     );
      DateTime?date1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2023),
      );
    setState((){

      check=true;

      d=int.parse(DateFormat("dd").format(date1!));
      m=int.parse(DateFormat("MM").format(date1));
      y=int.parse(DateFormat("yy").format(date1));

      int d1=d=int.parse(DateFormat("dd").format(DateTime.now()));
      int m1=d=int.parse(DateFormat("MM").format(DateTime.now()));
      int y1=d=int.parse(DateFormat("yy").format(DateTime.now()));
      int day=finddays(m1,y1);

      if(d1-d>=0){
        day1=(d1-d).toString()+" days";
      }else{
        day1 = (d1+day-d).toString() + " days";
        m1=m1-1;
      }
      if(m1-m>0){
        month1=(m1-m).toString()+" months";
      }else{
        month1=(m1+12-m).toString()+" months";
        y1=y1-1;
      }
      year1=(y1-y).toString()+" years";
    });
  }

  int finddays(int m2,int y2,){
    int day2;
    if(m2 == 1 || m2 == 3 || m2 == 5 || m2 == 7 || m2 == 8 || m2 ==10 || m2 == 12){
      day2 = 31;
    }else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11){
      day2 = 30;
    }else{
      if(y2 % 4 == 0){
        day2 = 29;
      }else{
        day2 = 28;
      }
    }
    return day2;
  }
}

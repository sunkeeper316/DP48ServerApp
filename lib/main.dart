import 'package:dp48_server_app/api/api_manage.dart';
import 'package:dp48_server_app/api/api_server.dart';
import 'package:dp48_server_app/setting_view.dart';
import 'package:dp48_server_app/sharedpreference/sharedpreferences.dart';
import 'package:flutter/material.dart';

import 'api/Response/response_get_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Data> datas = [];

  @override
  void initState() {
    super.initState();

    initGetData();
  }

  void initGetData() async {
    await SharedPreference.loadIP();
    ApiServer.setIP();
    try {
      var response = await ApiManage().getData();
      if (response.error == 0){
        // print(response.data?.length);
        setState(() {
          datas = response.data ?? [];
        });
      }else{
        setState(() {
          datas = [];
        });
      }
    }catch(e){

      setState(() {
        datas = [];
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("DP48ServerDemo"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingView())),
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            initGetData();
          },
          child: ListView.separated(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            // controller: scrollController,

            itemBuilder: (BuildContext context, int index) {
              var data = datas[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) async {
                  print("delete ${index}");
                  setState(() {
                    datas.remove(data);
                  });
                  if (data.packetId != null){
                    var response = await ApiManage().deleteData(data.packetId! );
                    if (response.error == 0){

                    }
                  }

                },
                background: Container(color: Colors.red),
                child: Container(
                  // color: AppColors.Dark_Gary,
                  // height: 60,
                  child: ListTile(
                    onTap: () async {
                    },
                    title: Text('net:${datas[index].netWeight ?? ''} tar:${datas[index].tareWeight ?? ''}' , style: TextStyle(color: Colors.black), maxLines: 2,overflow: TextOverflow.ellipsis,),
                    subtitle: Text('id:${datas[index].id ?? ''} nid:${datas[index].nid ?? ''}', style: TextStyle(color: Colors.black , fontSize: 10) , maxLines: 1,overflow: TextOverflow.ellipsis,),
                    leading: Container(
                      child: Text( '${datas[index].index ?? ''}' , style: TextStyle(color: Colors.black), maxLines: 1,overflow: TextOverflow.ellipsis,),
                    ),
                    trailing: Container(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            child: Text( 'height:${datas[index].height ?? ''} bmi:${datas[index].bmi ?? ''}'
                              ,
                              style: TextStyle(color: Colors.black, fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              datas[index].time ?? '',
                              style: TextStyle(color: Colors.black, fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              );

            },

            separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey,),
            itemCount: datas.length,
          ),
        ),

      ),
    );
  }
}

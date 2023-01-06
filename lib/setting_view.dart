import 'package:dp48_server_app/api/api_manage.dart';
import 'package:dp48_server_app/api/api_server.dart';
import 'package:dp48_server_app/sharedpreference/sharedpreferences.dart';
import 'package:flutter/material.dart';

import 'api/Response/response_get_data.dart';

class SettingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingState();
}

class SettingState extends State<SettingView> {

  TextEditingController tecIP = TextEditingController();

  @override
  void initState() {
    super.initState();
    tecIP.text = ApiServer.Ip;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("DP48ServerDemo"),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: 
          Container(
            padding: EdgeInsets.all(20),
            child: Column(

              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: tecIP,
                  decoration: InputDecoration(
                  labelText: 'ip',
                  hintText: 'input ip',
                  // prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                ),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'port',
                //     hintText: '請輸入ip',
                //     // prefixIcon: Icon(Icons.account_circle_rounded),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async {
                    ApiServer.Ip = tecIP.text;
                    // print(ApiServer.Ip);
                    ApiServer.setIP();
                    await SharedPreference.saveIP();
                    Navigator.pop(context);
                  }, child: Text('OK'),),
                )

              ],
            ),
          ),
      
    );
  }

}
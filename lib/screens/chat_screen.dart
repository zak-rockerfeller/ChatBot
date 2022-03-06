import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chatbot/config/palette.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });


    //print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {Navigator.pop(context);},
                        icon: const Icon(
                          FontAwesomeIcons.robot,
                          size: 30,
                          color: Palette.labys_light,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Chat',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.4,
                              color: Palette.labys_light),),
                      ),

                    ],
                  ),

                ],
              )
            ],
          ),

        ),
        body: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            const SizedBox(height: 20,),

            const Divider(height: 5.0, color: Palette.labys_light,),
            ListTile(
              leading: IconButton(
                icon: const Icon(FontAwesomeIcons.plusCircle, color: Palette.labys_light, size: 35,),
                onPressed: () => print,
              ),

              title: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(width: 0.5, color: Palette.labys_light),
                  color: Colors.transparent,),
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  controller: messageInsert,
                  decoration: const InputDecoration(
                    hintText: "Send message",
                    hintStyle: TextStyle(
                        color: Palette.labys_light,
                        fontSize: 18),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),

                  //style: const TextStyle(fontSize: 18, color: Colors.black),
                  onChanged: (value) {

                  },
                ),
              ),

              trailing: IconButton(

                  icon: const Icon(Icons.send, size: 30.0, color: Palette.labys_light),
                  onPressed: () {
                    if (messageInsert.text.isEmpty) {
                      print("empty message");
                    } else {
                      setState(() {
                        messsages.insert(0,
                            {"data": 1, "message": messageInsert.text});
                      });
                      response(messageInsert.text);
                      messageInsert.clear();
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }),
            ),
            const SizedBox(height: 15.0,)
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0 ? Container(
            height: 40,
            width: 40,
            child: const Icon(FontAwesomeIcons.robot)
          ) : Container(),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Bubble(
                radius: const Radius.circular(15.0),
                color: data == 0 ? Palette.labys_dark : Palette.labys_light,
                elevation: 0.0,

                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(width: 5.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: const BoxConstraints( maxWidth: 200),
                            child: Text(
                              message,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),),
                          ))
                    ],
                  ),
                )),
          ),


          data == 1? const SizedBox(
            height: 40,
            width: 40,
            child: Icon(FontAwesomeIcons.user)
          ) : Container(),

        ],
      ),
    );
  }
}
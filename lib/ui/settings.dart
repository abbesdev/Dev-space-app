import 'dart:io'; // for File

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/firestore_constants.dart';
import '../models/User.dart';
import '../utils/SettingsProvider.dart';
import 'calls.dart';
import 'chat.dart';
import 'videocalls.dart';

class Settingss extends StatefulWidget {
  const Settingss({Key? key}) : super(key: key);

  @override
  _SettingssState createState() => _SettingssState();
}

TextEditingController? controllerNickname;
TextEditingController? controllerAboutMe;

class _SettingssState extends State<Settingss> {
//new items

  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';

  bool isLoading = false;
  File? avatarImageFile;
  late SettingProvider settingProvider;

  final FocusNode focusNodeNickname = FocusNode();
  final FocusNode focusNodeAboutMe = FocusNode();

  @override
  void initState() {
    super.initState();
    settingProvider = context.read<SettingProvider>();
    readLocal();
  }

  void readLocal() {
    setState(() {
      id = settingProvider.getPref(FirestoreConstants.id) ?? "";
      nickname = settingProvider.getPref(FirestoreConstants.nickname) ?? "";
      aboutMe = settingProvider.getPref(FirestoreConstants.aboutMe) ?? "";
      photoUrl = settingProvider.getPref(FirestoreConstants.photoUrl) ?? "";
    });

    controllerNickname = TextEditingController(text: nickname);
    controllerAboutMe = TextEditingController(text: aboutMe);
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile = await imagePicker
        .getImage(source: ImageSource.gallery)
        .catchError((err) {
      Fluttertoast.showToast(msg: err.toString());
    });
    File? image;
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    if (image != null) {
      setState(() {
        avatarImageFile = image;
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future uploadFile() async {
    String fileName = id;
    UploadTask uploadTask =
        settingProvider.uploadFile(avatarImageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      photoUrl = await snapshot.ref.getDownloadURL();
      UserChat updateInfo = UserChat(
        id: id,
        photoUrl: photoUrl,
        nickname: nickname,
        aboutMe: aboutMe,
      );
      settingProvider
          .updateDataFirestore(
              FirestoreConstants.pathUserCollection, id, updateInfo.toJson())
          .then((data) async {
        await settingProvider.setPref(FirestoreConstants.photoUrl, photoUrl);
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "Upload success");
      }).catchError((err) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: err.toString());
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  void handleUpdateData() {
    focusNodeNickname.unfocus();
    focusNodeAboutMe.unfocus();

    setState(() {
      isLoading = true;
    });
    UserChat updateInfo = UserChat(
      id: id,
      photoUrl: photoUrl,
      nickname: nickname,
      aboutMe: aboutMe,
    );
    settingProvider
        .updateDataFirestore(
            FirestoreConstants.pathUserCollection, id, updateInfo.toJson())
        .then((data) async {
      await settingProvider.setPref(FirestoreConstants.nickname, nickname);
      await settingProvider.setPref(FirestoreConstants.aboutMe, aboutMe);
      await settingProvider.setPref(FirestoreConstants.photoUrl, photoUrl);

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Update success");
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString());
    });
  }

//end of new items

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Profile Settings",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                ],
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CupertinoButton(
                    onPressed: getImage,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: avatarImageFile == null
                          ? photoUrl.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.network(
                                    photoUrl,
                                    fit: BoxFit.cover,
                                    width: 70,
                                    height: 70,
                                    errorBuilder:
                                        (context, object, stackTrace) {
                                      return Icon(
                                        Icons.account_circle,
                                        size: 70,
                                        color: secondaryColor,
                                      );
                                    },
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: 70,
                                        height: 70,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: secondaryColor,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Icon(
                                  Icons.account_circle,
                                  size: 70,
                                  color: secondaryColor,
                                )
                          : Image.file(
                              avatarImageFile!,
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                    ))
              ]),
              SizedBox(height: height / 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        controllerNickname!.text,
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "My Status",
                        style: TextStyle(
                            color: myGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          width: 70,
                          child: CupertinoSwitch(
                            activeColor: mainColor,
                            value: true,
                            onChanged: (bool value) {
                              value = !value;
                            },
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Online",
                        style: TextStyle(
                            color: myBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 100),
              Row(
                children: [
                  Text(
                    "Full name",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(height: height / 100),
              Row(
                children: [
                  Container(
                      width: width - 40,
                      height: 70,
                      child: TextFormField(
                        controller: controllerNickname,
                        onChanged: (value) {
                          nickname = value;
                        },
                        focusNode: focusNodeNickname,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(22),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: myGrey.withOpacity(0.1),
                            hintText: 'Mohamed abbes'),
                      )),
                ],
              ),

              SizedBox(height: height / 100),
              Row(
                children: [
                  Text(
                    "Bio",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(height: height / 100),
              Row(
                children: [
                  Container(
                      width: width - 40,
                      child: TextFormField(
                        controller: controllerAboutMe,
                        onChanged: (value) {
                          aboutMe = value;
                        },
                        focusNode: focusNodeAboutMe,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 6,
                        minLines: 3,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(22),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0),
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: myGrey.withOpacity(0.1),
                            hintText:
                                'Hello im mohamed abbes im 22 years old and currently developing devspace app for my personal project hobbies. thanks for sharing'),
                      )),
                ],
              ),
              //Bottom bar after this line
// Button
              Container(
                child: TextButton(
                  onPressed: handleUpdateData,
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 50, bottom: 50),
              ),

              Row(
                children: [
                  Container(
                    width: width - 40,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFE0F4FF).withOpacity(0.46)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen()))),
                                child: Image.asset(
                                  "assets/Message.png",
                                  width: 24,
                                ),
                              ),
                              GestureDetector(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CallsScreen()))),
                                child: Image.asset(
                                  "assets/Phone.png",
                                  width: 26,
                                ),
                              ),
                              GestureDetector(
                                child: Image.asset("assets/Group 33628.png"),
                              ),
                              GestureDetector(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VideoCallsScreen()))),
                                child: Image.asset("assets/video.png"),
                              ),
                              GestureDetector(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Settingss()))),
                                child: Image.asset(
                                  "assets/userr.png",
                                  width: 24,
                                ),
                              )
                            ],
                          )
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

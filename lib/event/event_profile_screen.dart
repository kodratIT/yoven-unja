import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yoven/event/event_full_app.dart';
import 'package:yoven/event/event_full_app_admin.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_container.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:yoven/helpers/widgets/my_button.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:image_picker/image_picker.dart';

import '../auth/firebase_auth_/showToast.dart';

class EventProfileScreen extends StatefulWidget {
  @override
  _EventProfileScreenState createState() => _EventProfileScreenState();
}

class _EventProfileScreenState extends State<EventProfileScreen> {
  // bool _passwordVisible = false;
  late CustomTheme customTheme;
  late ThemeData theme;

  late String _emailUser= '';
  late String _userId ='';
  Map<String, dynamic>? DataUser ;
  late List<Map<String, dynamic>?> userDataList;
  String _imagesurl = '';

 

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  File? imageFile1;
  
  
  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _emailUser = getCurrentUserEmail();
    _userId = getCurrentUserId();
    // _getUsers(_userId);
    fetchData(_userId);
    
  
  } 

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();


  String getCurrentUserEmail() {
  User? user = FirebaseAuth.instance.currentUser;

  // Check if there is a currently signed-in user
  if (user != null) {
    
    return user.email.toString();
  } else {
    // No user is signed in
      return '';
    }
  }

  String getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser;

  // Check if there is a currently signed-in user
  if (user != null) {
    
    return user.uid;
  } else {
    // No user is signed in
      return '';
    }
  }

  bool isLoading = true;
  void fetchData(String userId)async {
    DataUser = await _getUsers(userId);

    _nameController = TextEditingController(text: DataUser?['name'].toString());
    _phoneController = TextEditingController(text: DataUser?['mobile_phone'].toString());
    _imagesurl = DataUser!['images'].toString();
  }

  Future<Map<String, dynamic>?> _getUsers(String userid) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  try {
    QuerySnapshot<Object?> querySnapshot =
        await users.where('id', isEqualTo: userid).get();

    userDataList = [];
    if (querySnapshot.docs.isNotEmpty) {
      // Assuming 'id' is a unique identifier, there should be at most one document
      // Access the data from the first document
      Map<String, dynamic> userData = querySnapshot.docs[0].data() as Map<String, dynamic>;

      // Print the user data
      print('User Data:');
      userData.forEach((key, value) {
        print('$key: $value');
      });

      return userData;
    } else {
      // Handle the case where no user with the given ID is found
      print('User not found');
      return null;
    }

  } catch (e) {
    // Handle errors, e.g., Firebase errors
    print('Error querying users collection: $e');
    // You can also throw the exception if you want to propagate it
    throw e;
  }
}

  void _save()async
  {
    _uploadImage();
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => EventFullAppAdmin()),
    // );
  }

  Future<void> updateUserData(String userId, String newName, String newMobilePhone,String Images) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  try {
    // Fetch the user document
    QuerySnapshot<Object?> querySnapshot =
        await users.where('id', isEqualTo: userId).get();

    if (querySnapshot.docs.isNotEmpty) {
      // Assuming 'id' is a unique identifier, there should be at most one document
      DocumentSnapshot<Object?> userDocument = querySnapshot.docs[0];
      // Update the user data
      print(Images);
      if(Images == 'null'){
        await users.doc(userDocument.id).update({
          'name': newName,
          'mobile_phone': newMobilePhone,
        });
      }else{
        await users.doc(userDocument.id).update({
        'name': newName,
        'mobile_phone': newMobilePhone,
        'images' : Images
      });
      }

      print('user success');

    } else {
      print('User not found for ID: $userId');
    }
  } catch (e) {
    // Handle errors if needed
    print('Error updating user data: $e');
  }
}

   File? _imageFile;
  String? _downloadURL;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<String?> _uploadImage() async {
    String _LinkImages ='';
    if (_imageFile == null) {
      print('No image selected');
      updateUserData(_userId, _nameController.text, _phoneController.text,'null');
      return '';
    }
    String extension = 'jpg';
    String imageName = generateUniqueImageName(extension); // Nama gambar yang akan disimpan

    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('images/$imageName');
      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      _downloadURL = await taskSnapshot.ref.getDownloadURL();

      _LinkImages = _downloadURL!;

      updateUserData(_userId, _nameController.text, _phoneController.text,_LinkImages);
     
      print('Download URL: $_downloadURL');
    } catch (e) {
      print('Error uploading image: $e');
    }

    return _LinkImages;

  }

  String generateUniqueImageName(String extension) {
  // Mendapatkan timestamp saat ini
  DateTime now = DateTime.now();

  // Format timestamp sebagai string untuk digunakan sebagai nama gambar
  String formattedTimestamp = DateFormat('yyyyMMdd_HHmmss').format(now);

  // Menyusun nama gambar dengan format 'image_timestamp'
  String imageName = 'image_$formattedTimestamp.$extension';

  return imageName;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      MyContainer.rounded(
                        paddingAll: 0,
                        width: 140,
                        height: 140,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                       child: _imageFile == null
                          ? Image.network(
                              "${_imagesurl}",
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              File(
                                _imageFile!.path,
                              ),
                              fit: BoxFit.cover,
                            ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            _pickImage();

                            // print(imageFile);
                          },
                          child: MyContainer.rounded(
                            border: Border.all(
                                color: theme.scaffoldBackgroundColor,
                                width: 2,
                                style: BorderStyle.solid),
                            paddingAll: 6,
                            color: theme.colorScheme.primary,
                            child: Icon(
                              LucideIcons.pencil,
                              size: 20,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  MyText.titleLarge(_nameController.text,
                      fontWeight: 600, letterSpacing: 0),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 36, left: 24, right: 24),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: _nameController.text,
                        hintStyle: MyTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          LucideIcons.user,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      controller:_nameController,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      readOnly: true,
                      style: MyTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "${_emailUser}",
                        hintStyle: MyTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          LucideIcons.mail,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: TextEditingController(text: "${_emailUser}"),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: MyTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Phone",
                        hintStyle: MyTextStyle.titleSmall(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          LucideIcons.phone,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.sentences,
                      controller: _phoneController,
                    ),
                  ),
                
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: MyButton(
                        onPressed: (){
                           if(_emailUser == 'kodratcoc@gmail.com'){
                            showToast(message: "Profile Successfully updated");
                            _save();
                           }else{
                            _save();
                            Get.off(EventFullApp());
                            showToast(message: "Profile Successfully updated");
                           }
                        },
                        borderRadiusAll: 4,
                        elevation: 0,
                        child: MyText.labelMedium("UPDATE",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.3)),
                  ),
                ],
              ),
            ),
          ],
        ));
}
}

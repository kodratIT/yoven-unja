import 'package:intl/intl.dart';
import 'package:yoven/auth/firebase_auth_/showToast.dart';
import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/widgets/my_spacing.dart';
import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';
import 'dart:io';


class EventCreateScreen extends StatefulWidget {
  @override
  _EventCreateScreenState createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  DateTime? selectedDate;
  File? _imageFile;
  String? _downloadURL;


  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _capacitycontroller = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _eventstartController = TextEditingController();
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _DetailLocationController = TextEditingController();
  TextEditingController _timeEventController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();


  Future<int> getNextId() async {
    final DocumentReference counterDoc = FirebaseFirestore.instance.collection('counters').doc('eventCounter');
    final DocumentSnapshot counterSnapshot = await counterDoc.get();

    int currentCount = counterSnapshot.exists ? counterSnapshot['count'] : 0;

    // Increment the counter and update it in Firestore
    await counterDoc.set({'count': currentCount + 1});

    return currentCount + 1;
  }

  Future<void> addEventWithAutoIncrement() async {
    final CollectionReference events = FirebaseFirestore.instance.collection('events');
    final int nextId = await getNextId();
    try {
      await events.doc(nextId.toString()).set({
        'id': nextId,
        'capacity': _capacitycontroller.text,
        'date_event': _eventstartController.text,
        'description': _descriptionController.text,
        'images': _downloadURL,
        'location': _LocationController.text,
        'location_detail': _DetailLocationController.text,
        'name': _titlecontroller.text,
        'time_event': _timeEventController.text,
        'category': _categoryController.text,
      });
      _categoryController.text = "";
      _capacitycontroller.text = "";
      _eventstartController.text = "";
      _descriptionController.text = "";
      _LocationController.text = "";
      _DetailLocationController.text = "";
      _titlecontroller.text = "";
      _timeEventController.text = "";
      _categoryController.text = "";
      
      setState(() {
        _imageFile = null;
      });
      showToast(message: "Event Successfully Created");
    } catch (e) {
      showToast(message: "Event Galat Created");
      
    }
    
  }


  void addEvent() async {

    _uploadImage();
    addEventWithAutoIncrement();
  }


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
      return '';
    }
    String extension = 'jpg';
    String imageName = generateUniqueImageName(extension); // Nama gambar yang akan disimpan

    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('events/$imageName');
      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      _downloadURL = await taskSnapshot.ref.getDownloadURL();
      
      
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




  _pickDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate!,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          showSnackbarWithFloating(
              "${picked.day} - ${picked.month} - ${picked.year}");
        });
      }
    }

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    selectedDate = DateTime.now();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
              children: [
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: Image(
                          image: AssetImage(
                              './assets/images/profile/avatar_4.jpg'),
                          width: 44,
                          height: 44,
                        ),
                      ),
                      Container(
                        margin: MySpacing.left(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodyMedium("Kodrat Pamungkas",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600),
                            MyText("Create new event",
                                color: customTheme.colorSuccess,
                                fontWeight: 500),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 8, 24, 0),
                  child: TextFormField(
                    controller: _titlecontroller,
                    style: MyTextStyle.headlineSmall(
                        color: theme.colorScheme.onBackground,
                        letterSpacing: -0.4,
                        fontWeight: 800),
                    decoration: InputDecoration(
                      fillColor: theme.colorScheme.background,
                      hintStyle: MyTextStyle.headlineSmall(
                          color: theme.colorScheme.onBackground,
                          letterSpacing: -0.4,
                          fontWeight: 800),
                      filled: false,
                      hintText: "Event title",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                 Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        if (_imageFile != null)
                          Image.file(
                            _imageFile!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                       
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _pickImage,
                        style: ButtonStyle(
                        backgroundColor: 
                            MaterialStateProperty.all<Color>(theme.colorScheme.onBackground), // Ganti warna sesuai keinginan
                        ),
                          child: MyText.bodyMedium("Pilih Image",
                        color: theme.colorScheme.onPrimary),
                      ),
                      SizedBox(height: 20),
                    //  ElevatedButton(
                    //     onPressed: () async {
                    //       if (_imageFile != null) {
                    //         await uploadImageToStorage(_imageFile!);
                    //       }
                    //     },
                    //     child: Text('Upload Gambar ke Cloud Storage'),
                    //   ),
                    ],
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _descriptionController,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Description",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _capacitycontroller,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Kapasitas Peserta",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _eventstartController,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Start",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _timeEventController,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Event Time ",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _LocationController,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Location",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _DetailLocationController,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Location Detail",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.fromLTRB(24, 0, 24, 0),
                  child: TextFormField(
                    controller: _categoryController,
                    enabled: false, // Set to false to make it read-only
                    readOnly: true,
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500,
                        letterSpacing: 0,
                        muted: true),
                    decoration: InputDecoration(
                      hintText: "Category",
                      hintStyle: MyTextStyle.bodyMedium(
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          letterSpacing: 0,
                          xMuted: true),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.4,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                theme.colorScheme.onBackground.withAlpha(50)),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  color: theme.colorScheme.background,
                  margin: EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 0),
                  child: Center(
                    child: CupertinoButton(
                    color: theme.colorScheme.onSurface,
                    onPressed: () {
                       _showSheet(context, _categoryController);
                    },
                    padding:
                        EdgeInsets.only(left: 100, top: 8, right: 100, bottom: 8),
                    pressedOpacity: 0.5,
                    child: MyText.bodyMedium("Kategori",
                        color: theme.colorScheme.onPrimary)),
                  ),
                ),


               
              ],
            ),
          ),
          Container(
            color: customTheme.card,
            padding: MySpacing.fromLTRB(24, 16, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        // text: "\$99",
                        style: MyTextStyle.bodyLarge(
                            fontWeight: 700,
                            letterSpacing: 0,
                            color: theme.colorScheme.primary)),
                    TextSpan(
                        // text: " /per person",
                        style: MyTextStyle.bodySmall(
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                        )),
                  ]),
                ),
                Container(
                  padding: MySpacing.fromLTRB(8, 8, 8, 8),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Row(
                    children: [
                      Container(
                        margin: MySpacing.left(12),
                        child: MyText.bodySmall("Create".toUpperCase(),
                            fontSize: 12,
                            letterSpacing: 0.7,
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 600),
                             
                      ),
                       GestureDetector(
                        onTap: () {
                          addEvent();
                        },
                        child: Container(
                          margin: MySpacing.left(16),
                          padding: MySpacing.all(4),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimary,
                              shape: BoxShape.circle),
                          child: Icon(
                            LucideIcons.chevronRight,
                            size: 20,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                  
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showSnackbarWithFloating(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MyText.titleSmall(message, color: theme.colorScheme.onPrimary),
          backgroundColor: theme.colorScheme.primary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

  void _showSheet(BuildContext context, TextEditingController controller) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: MyText.titleLarge("Kategori", fontWeight: 700, letterSpacing: 0.5),
        message: MyText.titleSmall("Pilih Kategori", fontWeight: 500, letterSpacing: 0.2),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: MyText.bodyLarge("Seminar", fontWeight: 600),
            onPressed: () {
              _updateTextField("Seminar", controller);
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: MyText.bodyLarge("Webinar", fontWeight: 600),
            onPressed: () {
              _updateTextField("Webinar", controller);
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: MyText.bodyLarge("Kuliah Umum", fontWeight: 600),
            onPressed: () {
              _updateTextField("Kuliah Umum", controller);
              Navigator.pop(context);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: MyText.titleMedium("Cancel", color: theme.colorScheme.error, fontWeight: 600),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _updateTextField(String category, TextEditingController controller) {
    controller.text = category;
  }

  Future<void> uploadImageToStorage(File imageFile) async {
    final String imageName = 'images/${generateRandomString(10)}.jpg'; // Adjust the length as needed
    final Reference storageReference = FirebaseStorage.instance.ref().child(imageName);

    try {
      await storageReference.putFile(imageFile);
      print('Image uploaded successfully!');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  String generateRandomString(int length) {
    return randomAlphaNumeric(length);
  }
}





import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/profile/widgets/profile_setup_form_field.dart';
import 'package:explorexpert/features/app/pages/profile/widgets/profile_setup_form_field_flex.dart';
import 'package:explorexpert/features/user_auth/firebase_auth_implementation/update_user.dart';
import 'package:explorexpert/global/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../global/navigation_menu.dart';
import '../../../../global/utilities/current_user_details.dart';
import '../../../repos/fetch_data/get_users.dart';
import '../../../user_auth/presentation/widgets/essentials.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final FireStoreService firestoreService = FireStoreService();

  String? _selectedOption;
  String? _dateTime;

  File? _image;
  String? _imageUrl;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 200, maxHeight: 200);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      String? downloadUrl = await _uploadImage();
      setState(() {
        _imageUrl = downloadUrl!;
      });
    }
  }

  Future<String?> _uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref('Users/Traveler/Images/ProfilePictures/');
      final imagesRef =
          storageRef.child('${DateTime.now().toIso8601String()}.jpg');
      await imagesRef.putFile(_image!);

      final downloadURL = await imagesRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      return null;
    }
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: null,
      firstDate: DateTime(1947),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _dateTime = DateFormat('dd MMMM yyyy').format(value!);
      });
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Setup Profile',
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: FutureBuilder<DocumentSnapshot>(
                future:
                    firestoreService.getCurrentUserStream(EXCurrentUser.email),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child:
                            const Center(child: CircularProgressIndicator()));
                  }

                  var currentUser =
                      snapshot.data!.data() as Map<String, dynamic>;
                  _nameController.text = currentUser['name'] ?? '';
                  _cityController.text = currentUser['city'] ?? '';
                  _countryController.text = currentUser['country'] ?? '';
                  _dobController.text = _dateTime ?? (currentUser['dob'] ?? '');
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: (_image != null)
                                    ? Image(
                                        image: FileImage(_image!),
                                      )
                                    : ((currentUser['profilepic'] == null)
                                        ? const Icon(
                                            FontAwesomeIcons.solidCircleUser,
                                            size: 100,
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                currentUser['profilepic'])))),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: EXColors.primaryLight,
                              ),
                              child: IconButton(
                                onPressed: _pickImage,
                                icon: const Icon(Icons.camera_alt,
                                    size: 20.0, color: EXColors.primaryDark),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          currentUser['email'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Form(
                        child: Column(
                          children: [
                            ProfileSetupFormField(
                              controller: _nameController,
                              isEnabled: true,
                              preIcon: Icons.person,
                              labelText: 'Name',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  ProfileSetupFormFieldFlex(
                                    widthPercentage: 0.65,
                                    controller: _dobController,
                                    isEnabled: false,
                                    preIcon: Icons.calendar_month,
                                    labelText: 'Date of Birth',
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _showDatePicker();
                                        _imageUrl ??= currentUser['profilepic'];
                                      },
                                      icon: const Icon(
                                          Icons.calendar_month_outlined)),
                                ],
                              ),
                            ),
                            const Divider(
                                thickness: 2, color: EXColors.disabledText),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 8),
                              child: Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.venusMars,
                                    color: EXColors.primaryDark,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 'male',
                                          groupValue: _selectedOption,
                                          onChanged: _handleRadioValueChange),
                                      const Text('Male'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 'female',
                                          groupValue: _selectedOption,
                                          onChanged: _handleRadioValueChange),
                                      const Text('Female'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                                thickness: 2, color: EXColors.disabledText),
                            ProfileSetupFormField(
                              controller: _cityController,
                              isEnabled: true,
                              preIcon: Icons.location_pin,
                              labelText: 'City',
                            ),
                            ProfileSetupFormField(
                              controller: _countryController,
                              isEnabled: true,
                              preIcon: FontAwesomeIcons.globe,
                              labelText: 'Country',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: MaterialButton(
                                  onPressed: _updateProfile,
                                  color: EXColors.primaryDark,
                                  disabledColor: EXColors.disabledText,
                                  height: 60,
                                  mouseCursor: WidgetStateMouseCursor.clickable,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: EXColors.secondaryLight,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.save,
                                          color: EXColors.secondaryLight,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedOption = value;
    });
  }

  void _updateProfile() async {
    if (_dateTime == null) {
      showToast(message: 'Please Select Date Of Birth');
    } else if (_selectedOption == null) {
      showToast(message: 'Please Select Gender');
    }
    var newProfilepic = _imageUrl;
    String newName = _nameController.text;
    String newDOB = _dateTime!;
    String newGender = _selectedOption!;
    String newCity = _cityController.text;
    String newCountry = _countryController.text;
    String email = EXCurrentUser.email;

    await updateUser(
        email, newName, newDOB, newGender, newCity, newCountry, newProfilepic);
    showToast(message: 'Profile updated Successfuly!');

    if (mounted) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NavigationMenu()));
    }
  }
}

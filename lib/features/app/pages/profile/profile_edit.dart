import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/profile/widgets/profile_edit_form_field.dart';
import 'package:explorexpert/features/app/pages/profile/widgets/profile_edit_form_field_flex.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../global/toast.dart';
import '../../../../global/utilities/current_user_details.dart';
import '../../../repos/fetch_data/get_users.dart';
import '../../../user_auth/firebase_auth_implementation/update_user.dart';
import '../../../user_auth/presentation/widgets/essentials.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FireStoreService firestoreService = FireStoreService();
  bool editEnabled = false;
  String? _selectedOption;
  String? _dateTime;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1947),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = DateFormat('dd MMMM yyyy').format(value);
        });
      }
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
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
                  _dobController.text = _dateTime ?? currentUser['dob'];
                  String gender = _selectedOption ?? currentUser['gender'];
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: (currentUser['profilepic'] == null)
                                    ? const Icon(
                                        FontAwesomeIcons.solidCircleUser,
                                        size: 100,
                                      )
                                    : Image(
                                        image: NetworkImage(
                                            currentUser['profilepic']))),
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
                                onPressed: () {},
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
                            ProfileEditFormField(
                              controller: _nameController,
                              isEnabled: editEnabled ? true : false,
                              preIcon: Icons.person,
                              labelText: 'Name',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  ProfileEditFormFieldFlex(
                                    widthPercentage: 0.65,
                                    controller: _dobController,
                                    isEnabled: false,
                                    preIcon: Icons.calendar_month,
                                    labelText: 'Date of Birth',
                                  ),
                                  IconButton(
                                      onPressed:
                                          editEnabled ? _showDatePicker : null,
                                      icon: const Icon(
                                          Icons.calendar_month_outlined)),
                                ],
                              ),
                            ),
                            Divider(
                                thickness: editEnabled ? 2 : 1,
                                color: EXColors.disabledText),
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
                                          groupValue: gender,
                                          onChanged: editEnabled
                                              ? _handleRadioValueChange
                                              : null),
                                      const Text('Male'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 'female',
                                          groupValue: gender,
                                          onChanged: editEnabled
                                              ? _handleRadioValueChange
                                              : null),
                                      const Text('Female'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                                thickness: editEnabled ? 2 : 1,
                                color: EXColors.disabledText),
                            ProfileEditFormField(
                              controller: _cityController,
                              isEnabled: editEnabled ? true : false,
                              preIcon: Icons.location_pin,
                              labelText: 'City',
                            ),
                            ProfileEditFormField(
                              controller: _countryController,
                              isEnabled: editEnabled ? true : false,
                              preIcon: FontAwesomeIcons.globe,
                              labelText: 'Country',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.37,
                                    child: MaterialButton(
                                      onPressed: editEnabled
                                          ? null
                                          : () {
                                              setState(() {
                                                editEnabled = true;
                                              });
                                            },
                                      color: Colors.white,
                                      disabledColor: EXColors.disabledText,
                                      disabledTextColor:
                                          EXColors.secondaryLight,
                                      height: 60,
                                      mouseCursor:
                                          WidgetStateMouseCursor.clickable,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: editEnabled
                                                      ? EXColors.secondaryLight
                                                      : EXColors.primaryDark,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.edit,
                                              color: editEnabled
                                                  ? EXColors.secondaryLight
                                                  : EXColors.primaryDark,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.37,
                                    child: MaterialButton(
                                      onPressed:
                                          editEnabled ? _updateProfile : null,
                                      color: EXColors.primaryDark,
                                      disabledColor: EXColors.disabledText,
                                      height: 60,
                                      mouseCursor:
                                          WidgetStateMouseCursor.clickable,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Save',
                                              style: TextStyle(
                                                  color:
                                                      EXColors.secondaryLight,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'Joined : ',
                                      style: const TextStyle(fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: currentUser['joindate'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Delete Account',
                                      style: TextStyle(
                                        color: EXColors.warning,
                                        decoration: TextDecoration.underline,
                                        decorationColor: EXColors.warning,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
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
    String newName = _nameController.text;
    String newDOB = _dobController.text;
    String newGender = _selectedOption!;
    String newCity = _cityController.text;
    String newCountry = _countryController.text;
    String email = EXCurrentUser.email;

    await updateUser(email, newName, newDOB, newGender, newCity, newCountry);
    showToast(message: 'Profile updated Successfuly!');
    setState(() {
      editEnabled = false;
    });
  }
}

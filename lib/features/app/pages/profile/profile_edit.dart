import 'package:explorexpert/features/app/pages/profile/widgets/profile_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../user_auth/presentation/widgets/essentials.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool editEnabled = false;
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
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage('assets/images/userprofile1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: editEnabled
                              ? EXColors.primaryLight
                              : EXColors.secondaryMedium,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt,
                              size: 20.0,
                              color: editEnabled
                                  ? EXColors.primaryDark
                                  : EXColors.disabledText),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      ProfileFormField(
                        isEnabled: editEnabled ? true : false,
                        preIcon: Icons.person,
                        labelText: 'Name',
                      ),
                      ProfileFormField(
                        isEnabled: editEnabled ? true : false,
                        preIcon: Icons.calendar_month,
                        labelText: 'Date of Birth',
                      ),
                      ProfileFormField(
                        isEnabled: editEnabled ? true : false,
                        preIcon: FontAwesomeIcons.venusMars,
                        labelText: 'Gender',
                      ),
                      ProfileFormField(
                        isEnabled: editEnabled ? true : false,
                        preIcon: Icons.location_pin,
                        labelText: 'City',
                      ),
                      ProfileFormField(
                        isEnabled: editEnabled ? true : false,
                        preIcon: Icons.phone,
                        labelText: 'Phone Number',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.37,
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
                                disabledTextColor: EXColors.secondaryLight,
                                height: 60,
                                mouseCursor: WidgetStateMouseCursor.clickable,
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
                              width: MediaQuery.of(context).size.width * 0.37,
                              child: MaterialButton(
                                onPressed: editEnabled
                                    ? () {
                                        setState(() {
                                          editEnabled = false;
                                        });
                                      }
                                    : null,
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
                                        'Save',
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(
                              TextSpan(
                                text: 'Joined : ',
                                style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                    text: '03 October 2022',
                                    style: TextStyle(
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
            ),
          ),
        ),
      ),
    );
  }
}

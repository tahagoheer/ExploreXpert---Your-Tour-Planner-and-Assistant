import 'dart:io';
import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWidget4 extends StatefulWidget {
  const ProfileWidget4({super.key});

  @override
  _ProfileWidget4State createState() => _ProfileWidget4State();
}

class _ProfileWidget4State extends State<ProfileWidget4> {
  bool isEditable = true;
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController servicesController = TextEditingController();
  TextEditingController agencyController = TextEditingController();
  XFile? _imageFile;
  //  = AssetImage('assets/images/ProfileImg2.png');
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: isEditable ? _pickImage : null,
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                _imageFile == null ? null : FileImage(File(_imageFile!.path)),
            foregroundImage: const AssetImage('assets/images/ProfileImg2.png'),
          ),
        ),
        const SizedBox(height: 16),
        buildTextField('City', cityController),
        buildTextField('Address', addressController),
        buildTextField('Category', categoryController),
        buildTextField('Services', servicesController),
        buildTextField('Hotel/Agency', agencyController),
        IconButton(
          icon: Icon(isEditable ? Icons.check : Icons.edit),
          onPressed: () {
            setState(() {
              isEditable = !isEditable;
            });
          },
        ),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      width: MediaQuery.of(context).size.width * (80),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: EXColors.secondaryDark,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.24,
            child: Text(
              label,
              style: const TextStyle(
                color: EXColors.secondaryMedium,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.56,
            child: TextField(
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              controller: controller,
              readOnly: !isEditable,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}

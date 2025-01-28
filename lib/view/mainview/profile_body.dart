import 'package:flutter/material.dart';
import 'package:foodiee/Database/users_database_service.dart';
import 'package:foodiee/Database/users_model_class.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<ProfileBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  DateTime? selectedDate;
  String? gender;

  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    UsersModelClass user = await getUserByEmail(globleemail!);

    setState(() {
      _nameController.text = user.firstName!;
      _surnameController.text = user.lastName!;
      _phoneController.text = user.phoneNumber!;
      _emailController.text = user.email!;
      selectedDate = user.dateOfBirth != null
          ? DateTime.tryParse(user.dateOfBirth!)
          : null;
      gender = user.gender;
    });
  }

  Future<UsersModelClass> getUserByEmail(String email) async {
    UsersDatabaseService usersDatabaseService = UsersDatabaseService();
    List<UsersModelClass> users = await usersDatabaseService.fetch();

    return users.firstWhere(
      (user) => user.email == email,
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(Icons.arrow_back, color: Colors.blue),
      //   title: const Text(
      //     "My Details",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Upload Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Upload Picture"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Input Fields
            buildTextField("First Name", _nameController),
            const SizedBox(height: 10),
            buildTextField("Last Name", _surnameController),
            const SizedBox(height: 10),
            buildTextField(
              "Phone Number",
              _phoneController,
            ),
            const SizedBox(height: 10),
            buildTextField(
              "Email",
              _emailController,
            ),
            const SizedBox(height: 10),
            buildTextField(
              "Address",
              _addressController,
            ),
            const SizedBox(height: 10),
            buildDateField(context),
            const SizedBox(height: 10),
            buildDropdownField(),
            const SizedBox(height: 20),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveChangesOnTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool enabled = true}) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: enabled ? Colors.grey[100] : Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildDateField(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Date of Birth",
        suffixIcon: const Icon(Icons.calendar_today),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
        }
      },
      controller: TextEditingController(
        text: selectedDate != null
            ? "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
            : "",
      ),
    );
  }

  Widget buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: gender != null && gender!.isNotEmpty
          ? gender
          : "Prefer not to say", // Default to "Prefer not to say" if gender is null
      decoration: InputDecoration(
        labelText: "Select Gender",
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: const [
        DropdownMenuItem(value: "Male", child: Text("Male")),
        DropdownMenuItem(value: "Female", child: Text("Female")),
        DropdownMenuItem(value: "Other", child: Text("Other")),
        DropdownMenuItem(
            value: "Prefer not to say",
            child: Text("Prefer not to say")), // New option
      ],
      onChanged: (value) {
        setState(() {
          gender = value;
        });
      },
    );
  }

  void saveChangesOnTap() async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Changes Saved')));
    setState(() {
      globleAddress = _addressController.text;
    });
    final formattedDate = selectedDate != null
        ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
        : null;
    UsersModelClass usersModelClass = UsersModelClass(
        firstName: _nameController.text,
        lastName: _surnameController.text,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        dateOfBirth: formattedDate,
        gender: gender);
    UsersDatabaseService usersDatabaseService = UsersDatabaseService();
    await usersDatabaseService.update(usersModelClass);
  }
}

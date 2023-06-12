import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_seller_app/utils/colors.dart';
import 'package:food_seller_app/widgets/customTextField.dart';
import 'package:food_seller_app/widgets/error_dialog.dart';
import 'package:food_seller_app/widgets/loading_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> _getImage() async {
    imageFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile;
    });
  }

  Position? position;
  List<Placemark>? placeMarks;
  String sellerImageUrl = "";

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = newPosition;

    placeMarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    Placemark pMark = placeMarks![0];
    String completeAddress =
        "${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea}, ${pMark.postalCode},${pMark.country}";

    locationController.text = completeAddress;
  }

  Future<void> formValidation() async {
    if (imageFile == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: "Please select an image.");
          });
    } else {
      if (passwordController.text == confirmPasswordController.text) {
        if (nameController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            phoneController.text.isNotEmpty &&
            locationController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty) {
          // start uploading image
          showDialog(
              context: context,
              builder: (c) {
                return LoadingDialog(message: "Registering Account!!");
              });
              //save data in firebase storage
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          fStorage.Reference reference = fStorage.FirebaseStorage.instance
              .ref()
              .child("sellers")
              .child(fileName);
          fStorage.UploadTask uploadTask =
              reference.putFile(File(imageFile!.path));
          fStorage.TaskSnapshot taskSnapshot =
              await uploadTask.whenComplete(() {});
          await taskSnapshot.ref.getDownloadURL().then((url) {
            sellerImageUrl = url;
            //
          });
        } else {
          showDialog(
              context: context,
              builder: (c) {
                return ErrorDialog(
                    message:
                        "Please enter the required field for registration.");
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(message: "Password do not match.");
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _getImage();
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  backgroundColor: wColor,
                  backgroundImage: imageFile == null
                      ? null
                      : FileImage(
                          File(imageFile!.path),
                        ),
                  child: imageFile == null
                      ? Icon(
                          Icons.add_photo_alternate,
                          color: Colors.grey,
                          size: MediaQuery.of(context).size.width * 0.10,
                        )
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: nameController,
                            data: Icons.person,
                            hintText: "Name",
                            enabled: true,
                            isObsecure: false),
                        CustomTextField(
                            controller: emailController,
                            data: Icons.email,
                            hintText: "Email",
                            enabled: true,
                            isObsecure: false),
                        CustomTextField(
                            controller: phoneController,
                            data: Icons.call,
                            hintText: "Phone Number",
                            enabled: true,
                            isObsecure: false),
                        CustomTextField(
                            controller: passwordController,
                            data: Icons.lock,
                            hintText: "Password",
                            enabled: true,
                            isObsecure: true),
                        CustomTextField(
                            controller: confirmPasswordController,
                            data: Icons.lock,
                            hintText: "Confirm Password",
                            enabled: true,
                            isObsecure: true),
                        CustomTextField(
                            controller: locationController,
                            data: Icons.location_on,
                            hintText: "Cafe/Restaurant Address",
                            enabled: false,
                            isObsecure: false),
                        Container(
                          width: 400,
                          height: 40,
                          alignment: Alignment.center,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              getCurrentLocation();
                              // print("clicked");
                            },
                            label: Text(
                              "Get My Current Location",
                              style: GoogleFonts.poppins(color: wColor),
                            ),
                            icon: Icon(
                              Icons.location_on,
                              color: wColor,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: orange500Color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12,12,12,250),
                child: ElevatedButton(
                  onPressed: () {
                    formValidation();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    primary: wColor,
                  ),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      color: orange500Color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

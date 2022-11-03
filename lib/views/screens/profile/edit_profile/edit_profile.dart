import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../../../components/buttons.dart';
import '../../../../components/input.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../utils/db.dart';
import '../../../../utils/validator.dart';


class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var email = '';
  var id = '';
  inituser() async {
    email = await showEmail();
    id = await showId();
    print(id);
    setState(() {
      email;
      id;
    });
  }

  final _registerFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> _editProfileData = {
    'name': '66',
    'surname': '',
    'phone': '',
  };
  @override
  void initState() {
    inituser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // inituser();
    return Scaffold(
        body: Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackButtonWithHeader(
                text: 'Edit Profile',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Pallete.kGravishColor.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(7.0),
                          color: Pallete.kGravishColor.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8),
                          child: Text(
                            email,
                            style:
                                AppFonts.coloredHeading.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Pallete.kGravishColor.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(7.0),
                          color: Pallete.kGravishColor.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8),
                          child: Text(
                            'UserID: $id',
                            style:
                                AppFonts.coloredHeading.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      Form(
                        key: _registerFormKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            CustomInput2(
                              label: 'email',
                              hint: 'Enter your email',
                              onSaved: (value) {
                                _editProfileData['email'] = value;
                              },
                              type: 'number',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            CustomInput2(
                              label: 'username',
                              hint: 'Enter your username',
                              onSaved: (value) {
                                _editProfileData['username'] = value;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Pallete.kGravishColor.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(7.0),
                          color: Pallete.kGravishColor.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8),
                          child: Text(
                            'Change Language',
                            style: AppFonts.hintStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: ElevatedButton(
                              child: const Text('Update'),
                              onPressed: () {
//UpdateUtil.update(_registerFormKey, context,
                                   /// _editProfileData);
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Pallete.kPrimaryColor,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  minimumSize: const Size.fromHeight(50),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  primary: Pallete.kPrimaryColor,
                                  onPrimary: Pallete.whiteColor,
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  alignment: Alignment.center),
                            ),
                          ),
                          // const SizedBox(height: 24),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

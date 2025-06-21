import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:bouquetly_app/screen/profile/settings/bloc/settings_bloc.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/background_img.dart';
import 'package:bouquetly_app/widget/profile_widgets/custom_field.dart';
import 'package:bouquetly_app/widget/profile_widgets/option_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SettingsBloc>();
          return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  BackgroundImg(),
                  Center(
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            width: context.getWidth() * 0.3,
                            height: context.getWidth() * 0.3,
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/images/flowey.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Flowey The Flower',
                            style: AppTextStyle.headerText.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(188, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            width: context.getWidth() * 0.72,
                            child: Padding(
                              padding: EdgeInsetsGeometry.all(16),
                              child: Column(
                                spacing: 32,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  //Here every option is a button you can use it be using the attribute onPressed
                                  OptionRow(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  188,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              width: context.getWidth() * 0.586,
                                              height: context.getHight() * 0.36,
                                              child: Form(
                                                key: bloc.globalKey,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Enter your new name',
                                                      style: AppTextStyle
                                                          .headerText
                                                          .copyWith(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),

                                                    CustomField(
                                                      validator: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return 'Please enter your new name';
                                                        } else if (RegExp(
                                                          r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]',
                                                        ).hasMatch(p0)) {
                                                          return 'Enter a valid name ';
                                                        }
                                                        return null;
                                                      },
                                                      controller: bloc.newName,
                                                      setHint: 'Your Name',
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        if (bloc
                                                            .globalKey
                                                            .currentState!
                                                            .validate()) {
                                                          GetIt.I
                                                              .get<AuthLayer>();
                                                          print('object');
                                                        }
                                                      },
                                                      child: Text(
                                                        'Change',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    setIcon: Icons.location_on,
                                    setText: 'Change Name',
                                  ),
                                  OptionRow(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  188,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              width: context.getWidth() * 0.586,
                                              height: context.getHight() * 0.36,
                                              child: Form(
                                                key: bloc.globalKeyEmail,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Enter Your New Email',
                                                      style: AppTextStyle
                                                          .headerText
                                                          .copyWith(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),

                                                    CustomField(
                                                      controller: bloc.newEmail,
                                                      validator: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return 'Please Enter Your Email';
                                                          //input is an eamil
                                                        } else if (!RegExp(
                                                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                                                        ).hasMatch(p0)) {
                                                          return 'Please Enter A Valid Email';
                                                        } else {
                                                          bloc.confirmEmail =
                                                              p0;
                                                          return null;
                                                        }
                                                      },
                                                      setHint: 'New Email',
                                                    ),
                                                    CustomField(
                                                      validator: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return 'Please Enter Your Email';
                                                          //input is an eamil
                                                        } else if (!RegExp(
                                                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                                                        ).hasMatch(p0)) {
                                                          return 'Please Enter A Valid Email';
                                                        } else if (p0 !=
                                                            bloc.confirmEmail) {
                                                          return 'The emails doesn\'t match';
                                                        } else {
                                                          bloc.confirmEmail =
                                                              p0;
                                                          return null;
                                                        }
                                                      },
                                                      setHint:
                                                          'Confirm New Email',
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        if (bloc
                                                            .globalKeyEmail
                                                            .currentState!
                                                            .validate()) {
                                                          print('object');
                                                          GetIt.I
                                                              .get<AuthLayer>()
                                                              .updateEmail(
                                                                email: bloc
                                                                    .confirmEmail,
                                                              );
                                                          print('done');
                                                        }
                                                      },
                                                      child: Text(
                                                        'Change',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    setIcon: Icons.email,
                                    setText: 'Change Email',
                                  ),
                                  // here where the account will be deleted
                                  OptionRow(
                                    onPressed: () {
                                      print('Done');
                                      GetIt.I.get<AuthLayer>().deleteUser(GetIt.I.get<AuthLayer>().userID);
                                    },
                                    setIcon: Icons.delete,
                                    setText: 'Delete Account',
                                  ),
                                  OptionRow(
                                    onPressed: () {},
                                    setIcon: Icons.arrow_back,
                                    setText: 'Back',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

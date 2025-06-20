import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/background_img.dart';
import 'package:bouquetly_app/widget/profile_widgets/option_row.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                                      backgroundColor: const Color.fromARGB(
                                        188,
                                        255,
                                        255,
                                        255,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        width: 250,
                                        height: 350,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Enter your new name',
                                              style: AppTextStyle.headerText
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hint: Text('Your Name'),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
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
                                      backgroundColor: const Color.fromARGB(
                                        188,
                                        255,
                                        255,
                                        255,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        width: 250,
                                        height: 350,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Enter your new password',
                                              style: AppTextStyle.headerText
                                                  .copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hint: Text('Current Password'),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hint: Text('New Password'),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hint: Text(
                                                  'Confirm New Password',
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
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
                                    );
                                  },
                                );
                              },
                              setIcon: Icons.support_agent,
                              setText: 'Change Password',
                            ),
                            OptionRow(
                              onPressed: () {
                                Navigator.pop(context);
                              },
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
  }
}

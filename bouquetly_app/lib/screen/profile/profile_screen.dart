import 'package:bouquetly_app/extension/app_size.dart';
import 'package:bouquetly_app/repo/layer/auth/auth_layer.dart';
import 'package:bouquetly_app/screen/profile/account_settings_screen.dart';
import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:bouquetly_app/widget/background_img.dart';
import 'package:bouquetly_app/widget/profile_widgets/option_row.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authGetit = GetIt.I.get<AuthLayer>();

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
                      authGetit.username,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AccountSettingsScreen(),
                                  ),
                                );
                              },
                              setIcon: Icons.location_on,
                              setText: 'Account Settings',
                            ),
                            OptionRow(
                              onPressed: () {},
                              setIcon: Icons.support_agent,
                              setText: 'Support',
                            ),
                            OptionRow(setIcon: Icons.star, setText: 'Rate Us'),
                            OptionRow(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Are you sure?'),
                                      content: Text(
                                        'Stay Logged and check our new collections',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Logout',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              setIcon: Icons.logout,
                              setText: 'Logout',
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

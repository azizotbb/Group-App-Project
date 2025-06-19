import 'package:bouquetly_app/style/app_text_style.dart';
import 'package:flutter/material.dart';

class OptionRow extends StatelessWidget {
  const OptionRow({
    super.key,
    required this.setIcon,
    required this.setText,
    this.onPressed,
  });

  //set the icon for the row option
  final IconData setIcon;
  //set the text for the option
  final String setText;
  //what the button will do
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Icon(setIcon),
        TextButton(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),

          onPressed: onPressed,
          child: Text(setText,style: AppTextStyle.headerText.copyWith(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:takhti_app/theme/text_theme.dart';

class NotificationsModalBottomSheet extends StatelessWidget {
  const NotificationsModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTextTheme tt = CustomTextTheme();
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(onPressed:()=> Navigator.pop(context), icon: Icon(Icons.close)),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email Notifications',style: tt.bodyText1),
              Switch(
                value: true,
                onChanged: (value) {value = !value;},
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Push Notifications',style: tt.bodyText1),
              // add a switch
              Switch(
                value: true,
                onChanged: (value) {value = !value;},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

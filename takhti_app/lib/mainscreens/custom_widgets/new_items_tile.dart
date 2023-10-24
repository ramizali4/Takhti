import 'package:flutter/material.dart';
import '../../theme/text_theme.dart';

class NewItemsTile extends StatelessWidget {
  const NewItemsTile({
    super.key,
    required this.tt,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconbg,
    required this.bg,
    required this.ontap,
  });

  final CustomTextTheme tt;
  final Color iconbg;
  final Color bg;
  final IconData icon;
  final String title;
  final String subtitle;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: InkWell(
        onTap: (){ontap();},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: bg,
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconbg,
                  ),
                  child: Icon(icon,color: Colors.white,size: 20,),
                ),
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.loose,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: tt.introBody,),
                      Text(subtitle,style: TextStyle(fontFamily: 'Outfit',fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
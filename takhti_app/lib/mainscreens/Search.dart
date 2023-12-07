import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';

class Screen4 extends StatefulWidget {
  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  final _searchController = TextEditingController();
  CustomTextTheme tt = CustomTextTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 800,
                              ),
                              width: MediaQuery.of(context).size.width-100,
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search here...',
                                  hintStyle: tt.subtitle2,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: AppColorsDark.primaryBlack,),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
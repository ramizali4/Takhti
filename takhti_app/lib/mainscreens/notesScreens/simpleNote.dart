import 'package:flutter/material.dart';
import '/theme/color_theme.dart';
import '/theme/text_theme.dart';
import 'package:animated_expandable_fab/animated_expandable_fab.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final _titles = [' ', ' ', ' ', ' '];
  final _icons = [Icons.save, Icons.add_photo_alternate_outlined, Icons.delete, Icons.bookmark_added_outlined];

  String action = 'Choose an action';
  @override

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  CustomTextTheme tt = CustomTextTheme();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      // save floating action button
      floatingActionButton:   ExpandableFab(
        closeBackgroundColor: AppColorsDark.primaryBlack,
        closeShadowColor: Colors.grey,
        closeElevation: 5,
        openElevation: 4,
        distance: 100.0,
        closeIcon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        openIcon: const Icon(
          Icons.menu_outlined,
          color: AppColorsDark.primaryBlack,
        ),
        children: List.generate(_titles.length, (index) {
          return ActionButton(
            onPressed: () => setState(() {
              action = _titles[index];
            }),
            color: AppColorsDark.primaryBlack,
            closeFabOnTap: true,
            text: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Text(
                _titles[index],
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  color: AppColorsDark.primaryBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            icon: Icon(
              _icons[index],
              color: Colors.white,
            ),
          );
        }),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: AppColorsDark.primaryBlack,)),
                Container(
                  width: MediaQuery.of(context).size.width-80,
                  child: TextField(
                    textAlign: TextAlign.start,
                    style: tt.titleLarge,
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: tt.titleLarge,
                      //remove the line
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 30,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.grey.shade300,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        TextField(
                          controller: _contentController,
                          style: tt.bodyNormal,
                          decoration: InputDecoration(
                            hintText: 'Type something here...',
                            hintStyle: tt.subtitle2,
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

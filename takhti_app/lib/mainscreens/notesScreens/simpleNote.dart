import 'package:flutter/material.dart';
import 'package:takhti_app/UserPref.dart';
import '/theme/color_theme.dart';
import '/theme/text_theme.dart';
import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import '../../core/db/local_db.dart';
import '../../core/models/note.dart';

class NotePage extends StatefulWidget {
  final int? noteId;
  const NotePage({super.key, required this.noteId});

  @override
  State<NotePage> createState() => _NoteState();
}

class _NoteState extends State<NotePage> {
  final _titles = ['Save', ' ', 'Delete', ' '];
  final _icons = [
    Icons.save,
    Icons.add_photo_alternate_outlined,
    Icons.delete,
    Icons.bookmark_added_outlined
  ];

  String action = 'Choose an action';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  CustomTextTheme tt = CustomTextTheme();
  final ScrollController _scrollController = ScrollController();
  late bool isDelete;
  late String title;
  late String content;
  bool isLoading = false;
  late Note note;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    if(widget.noteId != null) {
      note = await NotesDatabase.instance.readNote(widget.noteId!);
      _titleController.text = note.title;
      _contentController.text = note.description;
    } else {
      note = Note(
        id: -1,
        title: '',
        description: '',
        createdTime: DateTime.now(),
        isDeleted: false,
        userId: user!.Id,
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      floatingActionButton: ExpandableFab(
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
              print(_titles[index]);
              action = _titles[index];
              if(action == 'Save') {
                title = _titleController.text;
                content = _contentController.text;

                if(note.id == -1) {
                  Note n = Note(
                    id: note.id,
                    title: title,
                    description: content,
                    createdTime: DateTime.now(),
                    isDeleted: false,
                    userId: user!.Id,
                  );
                  NotesDatabase.instance.create(n).then((int id) {
                    note.id = id;
                  });
                } else {
                  NotesDatabase.instance.update(note);
                }
                refreshNote();
              } else if(action == 'Delete') {
                isDelete = true;
                NotesDatabase.instance.update(note);
                Navigator.pop(context);
              }
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
        // ... your existing code ...
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios,
                          color: AppColorsDark.primaryBlack)),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: tt.titleLarge,
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: tt.titleLarge,
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
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  controller: _scrollController,
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
        ),
      ),
    );
  }
}

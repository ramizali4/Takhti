import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:takhti_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_widgets/notes_card.dart';
import 'notesScreens/simpleNote.dart';

import '../core/db/local_db.dart';
import '../core/models/note.dart';
import '../theme/text_theme.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final tt = CustomTextTheme();
  final String svgString = 'assets/climbing.svg';
  late double scr;
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    // NotesDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    scr = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : notes.isEmpty
              ? Center(child: noNotes())
              : buildNotes(),
    );
  }

  Widget noNotes() => Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgString,
                width: scr > 400 ? 500 : 250,
                height: scr > 400 ? 500 : 250,
              ),
              SizedBox.fromSize(size: Size(0, 20)),
              Text(
                'Start your journey',
                style: tt.titleLargeBG,
                textAlign: TextAlign.center,
              ),
              SizedBox.fromSize(size: Size(0, 10)),
              Text(
                'Every big step start with a small step \n Note your first idea and start your journey!',
                style: tt.bodyBG,
                textAlign: TextAlign.center,
              ),
              SizedBox.fromSize(size: Size(0, 10)),
            ],
          ),
        ),
      );
  Widget buildNotes() => StaggeredGrid.count(
      // itemCount: notes.length,
      // staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(
        notes.length,
        (index) {
          final note = notes[index];

          return StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotePage(noteId: note!.id),
                ));

                refreshNotes();
              },
              child: NoteCardWidget(note: note, index: index),
            ),
          );
        },
      ));
  // Widget buildNotes() => SingleChildScrollView(
  //       child: Column(
  //         children: List.generate(
  //           notes.length,
  //           (index) {
  //             final note = notes[index];
  //
  //             return Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: GestureDetector(
  //                 onTap: () async {
  //                   await Navigator.of(context).push(MaterialPageRoute(
  //                     builder: (context) => NotePage(noteId: note.id!),
  //                   ));
  //
  //                   refreshNotes();
  //                 },
  //                 child: NoteCardWidget(note: note, index: index),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     );

// Widget buildNotes() => StaggeredGridView.countBuilder(
//       padding: const EdgeInsets.all(8),
//       itemCount: notes.length,
//       staggeredTileBuilder: (index) => StaggeredTile.fit(2),
//       crossAxisCount: 4,
//       mainAxisSpacing: 4,
//       crossAxisSpacing: 4,
//       itemBuilder: (context, index) {
//         final note = notes[index];

//         return GestureDetector(
//           onTap: () async {
//             await Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => NoteDetailPage(noteId: note.id!),
//             ));

//             refreshNotes();
//           },
//           child: NoteCardWidget(note: note, index: index),
//         );
//       },
//     );
}

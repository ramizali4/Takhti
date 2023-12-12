import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/models/note.dart';
import '../../theme/color_theme.dart';

final _lightColors = [
  Color.fromRGBO(247, 246, 212, 1),
  Color.fromARGB(255, 249, 233, 247),
  Color.fromARGB(255, 253, 235, 171),
  Color.fromARGB(255, 218, 246, 228),
];

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    // return Card(
    //   color: color,
    //   child: Container(
    //     constraints: BoxConstraints(minHeight: minHeight),
    //     padding: const EdgeInsets.all(8),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           time,
    //           style: TextStyle(color: Colors.grey.shade700),
    //         ),
    //         const SizedBox(height: 4),
    //         Text(
    //           note.title,
    //           style: const TextStyle(
    //             color: Colors.black,
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Container(
    //       constraints: BoxConstraints(minHeight: minHeight),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(16),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const SizedBox(height: 8),
    //                 Text(
    //                   note.title,
    //                   style: const TextStyle(
    //                     color: AppColorsDark.primaryPurple,
    //                     fontSize: 30,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(16),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   note.description,
    //                   style: const TextStyle(
    //                     color: AppColorsDark.primaryPurple,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //       decoration: BoxDecoration(
    //         color: const Color.fromRGBO(156, 127, 197, 1),
    //         borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(12),
    //           bottomRight: Radius.circular(12),
    //         ),
    //       ),
    //       child: Text(
    //         note.category,
    //         style: const TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
    return Container(
      width: 200,
      height: 300,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Make border radius circular
        ),
        child: Container(
          constraints: BoxConstraints(minHeight: minHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: AppColorsDark.primaryPurple,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    note.description,
                    style: const TextStyle(
                      color: AppColorsDark.primaryPurple,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(156, 127, 197, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  note.category,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}

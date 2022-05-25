import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/inputs/custom_text_input.dart';
import 'package:flutter_playground/widgets/inputs/select_room_dropdown.dart';

class QuickNoteButton extends StatelessWidget {
  final bool showRoomSelectDropdown;

  const QuickNoteButton({
    Key? key,
    this.showRoomSelectDropdown = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(5.0),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const CustomTextInput(hintText: 'Add Quick Note'),
                    if (showRoomSelectDropdown) const SelectRoomDropdown(),
                    ElevatedButton(
                      style: ButtonStyle(
                        // TODO
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(horizontal: 30)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: const BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Save'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      tooltip: 'Add Quick Note',
      child: const Icon(Icons.add),
    );
  }
}

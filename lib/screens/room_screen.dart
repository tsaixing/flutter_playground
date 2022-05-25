import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/edit_room_screen.dart';
import 'package:flutter_playground/screens/task_screen.dart';
import 'package:flutter_playground/temp_data/checklist.dart';
import 'package:flutter_playground/widgets/buttons/quick_note_button.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = '/checklist';

  const RoomScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final tasks = DUMMY_CHECKLIST.toList();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String title = routeArgs['title']!;
    final String description = routeArgs['description']!;
    final String backgroundImageUrl = routeArgs['backgroundImageUrl']!;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          buildSliverAppBar(title, backgroundImageUrl),
          buildSliverReorderableList(title, backgroundImageUrl)
        ],
      ),
      floatingActionButton: const QuickNoteButton(showRoomSelectDropdown: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SliverAppBar buildSliverAppBar(String title, String backgroundImageUrl) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
        centerTitle: true,
        title: Text(title),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage(backgroundImageUrl),
                ),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment.center,
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        undoButton(),
        editButton(),
      ],
      // bottom: // TODO multiple checklists https://api.flutter.dev/flutter/material/TabBar-class.html,
    );
  }

  SliverReorderableList buildSliverReorderableList(
      String title, String backgroundImageUrl) {
    return SliverReorderableList(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = tasks.removeAt(oldIndex);
          tasks.insert(newIndex, item);
        });
      },
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final task = tasks[index];
        String taskName = task.label;

        return Dismissible(
          key: ValueKey(task.id),
          confirmDismiss: (direction) async {
            // Swiped to the left
            if (direction == DismissDirection.startToEnd) {
              setState(() {
                tasks.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$taskName completed!')));

              return true;
            }

            // Swiped to the right
            else if (direction == DismissDirection.endToStart) {
              Navigator.of(context).pushNamed(TaskScreen.routeName, arguments: {
                'id': task.id,
                'parentTitle': title,
                'taskTitle': task.label,
                'backgroundImageUrl': backgroundImageUrl,
              });

              return false;
            }
          },
          background: Container(
            color: Colors.green,
            padding: const EdgeInsets.only(left: 15),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.check),
            ),
          ),
          secondaryBackground: Container(
            color: Colors.blue,
            padding: const EdgeInsets.only(right: 15),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.info_outline),
            ),
          ),
          child: ListTile(
            key: ValueKey(tasks[index].id),
            // leading: const Icon(Icons.wb_sunny),
            title: Text(tasks[index].label),
            // subtitle: const Text('sunny, h: 80, l: 65'),
            trailing: const Icon(
                Icons.collections_outlined), // TODO display if task has images
          ),
        );
      },
    );
  }

  undoButton() {
    return IconButton(
      icon: const Icon(Icons.undo_outlined),
      tooltip: 'Undo Last Action',
      onPressed: () {
        // TODO implement undo last action
      },
    );
  }

  editButton() {
    return IconButton(
      icon: const Icon(Icons.edit),
      tooltip: 'Edit',
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditRoomScreen.routeName,
        );
      },
    );
  }
}

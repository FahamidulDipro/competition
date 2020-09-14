import 'package:flutter/material.dart';
import 'package:note_app2/Model/note_for_listing.dart';
import 'package:note_app2/views/note_delete.dart';
import 'package:note_app2/views/note_modify.dart';
import 'package:note_app2/views/thirdscreen.dart';

class NoteList extends StatefulWidget {
  String data;
  NoteList({this.data});

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
//  NoteForListing notes = NoteForListing(
//    noteTitle: 'Title',
//    noteDescription: 'Description',
//  );
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = !this.isSearching;
              });
            },
          )
        ],
        title: !isSearching
            ? Text('Note List')
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search note here',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoteModify()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.lightGreen, Colors.yellow[300]]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 28),
          child: ListView.separated(
            separatorBuilder: (_, __) => Container(
              margin: EdgeInsets.all(10),
//          child: Divider(
//            height: 1,
//            color: Colors.green,
//          ),
            ),
            itemBuilder: (BuildContext context, int index) {
              NoteForListing n1 = ListNote[index];
              return showNote(n1);

//
//
            },
            itemCount: ListNote.length,
          ),
        ),
      ),
    );
  }

  Widget showNote(NoteForListing n1) {
    return Dismissible(
      key: ValueKey(n1.noteTitle),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        final result =
            await showDialog(context: context, builder: (_) => NoteDelete());
        return result;
      },
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient:   LinearGradient(colors: [Colors.lightGreen, Colors.yellow[300]]),
        ),
        child: Align(
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: ListTile(
          onLongPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteModify(noteId: n1.noteTitle)));
          },
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ThirdScreen(
                          title: n1.noteTitle,
                          description: n1.noteDescription,
                        )));
          },
          title: Text(
            n1.noteTitle,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          subtitle: Text(n1.noteDescription),
        ),
      ),
    );
  }
}

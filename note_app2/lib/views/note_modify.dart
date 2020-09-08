import 'package:flutter/material.dart';
import 'package:note_app2/Model/note_for_listing.dart';
import 'package:note_app2/views/note_list.dart';

var ListNote = [];

class NoteModify extends StatefulWidget {
  String noteId;
  NoteModify({
    this.noteId,
  });

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteId != null;
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context)},),
        title: Text(
          isEditing ? 'Edit Notes' : 'Create Notes',
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Note Title',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 50,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Note Description',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteList(data: title)));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteList(data: description)));
                    NoteForListing n1 = NoteForListing(
                      noteTitle: title,
                      noteDescription: description,
                    );
                    setState(() {
                      ListNote.add((n1));

//                      print(n1.noteTitle);
//                      print(n1.noteDescription);
                    });
//                    print(ListNote.length);
//                    if (isEditing) {
//                      //update the note to api
//                    } else {
//                      //create note in api
//                    }
//                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  color: Colors.teal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

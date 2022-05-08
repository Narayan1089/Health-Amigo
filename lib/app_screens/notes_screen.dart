// import 'package:amigoproject/models/notes.dart';
// import 'package:amigoproject/providers/notes_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// // ignore: camel_case_types
// class Notes_Screen extends StatelessWidget {
//   final bool shouldPop = true;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return shouldPop;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.black54,
//         appBar: AppBar(
//           titleSpacing: 0.0,
//           toolbarHeight: 200,
//           title: Image.network(
//             "https://cdn.pixabay.com/photo/2017/10/31/23/33/desk-2906792_640.png",
//             // "https://9to5mac.com/wp-content/uploads/sites/6/2019/11/how-to-quickly-select-move-delete-notes-iphone-ipad-two-finger-tap.jpeg?quality=82&strip=all",
//             fit: BoxFit.cover,
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Consumer<NotesProviders>(
//             builder: (context, NotesProviders data, child) {
//               return data.getNotes.length != 0
//                   ? ListView.builder(
//                       itemCount: data.getNotes.length,
//                       itemBuilder: (context, index) {
//                         return CardList(data.getNotes[index], index);
//                       },
//                     )
//                   : GestureDetector(
//                       onTap: () {
//                         showAlertDialog(context);
//                       },
//                       child: Center(
//                           child: Text(
//                         "Add some notes now",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       )));
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showAlertDialog(context);
//           },
//           backgroundColor: Colors.white,
//           child: Icon(
//             Icons.add,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class CardList extends StatelessWidget {
//   final Notes notes;
//   int index;
//   CardList(this.notes, this.index);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Slidable(
//         actionPane: SlidableDrawerActionPane(),
//         actionExtentRatio: 0.25,
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 topLeft: Radius.circular(10),
//               )),
//           child: ListTile(
//             leading: Icon(Icons.note),
//             title: Text(notes.title),
//             subtitle: Text(notes.description),
//             trailing: Icon(
//               Icons.arrow_forward_ios,
//               color: Colors.black26,
//             ),
//           ),
//         ),
//         secondaryActions: <Widget>[
//           IconSlideAction(
//               caption: 'Delete',
//               color: Colors.red,
//               icon: Icons.delete,
//               onTap: () {
//                 print("Note deleted");
//                 Provider.of<NotesProviders>(context, listen: false)
//                     .removeNotes(index);
//               }),
//         ],
//       ),
//     );
//   }
// }

// showAlertDialog(BuildContext context) {
//   TextEditingController _Title = TextEditingController();
//   TextEditingController _Description = TextEditingController();
//   // Create button
//   Widget okButton = FlatButton(
//     child: Text("Add note"),
//     onPressed: () {
//       Provider.of<NotesProviders>(context, listen: false)
//           .addNotes(_Title.text, _Description.text);
//       // Navigator.pop(context);
//       // Navigator.of(context).pop();
//     },
//   );
//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Add a new note"),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           controller: _Title,
//           decoration: InputDecoration(hintText: "Enter Title"),
//         ),
//         TextField(
//           controller: _Description,
//           decoration: InputDecoration(hintText: "Enter Description"),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           'Tap anywhere in the screen to close this dialog box.',
//           textAlign: TextAlign.center,
//         ),
//       ],
//     ),
//     actions: [
//       okButton,
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

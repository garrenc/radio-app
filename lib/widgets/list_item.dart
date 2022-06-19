import 'package:flutter/material.dart';
import 'package:perm_fm/screens/tabs_screen.dart';

// ignore: must_be_immutable
class ListItem extends StatefulWidget {
  String name;
  String url;
  String imagePath;
  String number;
  String email;
  String vk;
  String tg;
  String website;
  String adress;
  bool isClicked = false;

  ListItem(this.name, this.url, this.imagePath, this.number, this.email,
      this.vk, this.tg, this.website, this.adress, this.isClicked,
      {Key? key})
      : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isClicked = true;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => TabsScreen(
                  0,
                  widget.name,
                  widget.url,
                  widget.imagePath,
                  widget.number,
                  widget.email,
                  widget.vk,
                  widget.tg,
                  widget.website,
                  widget.adress,
                  widget.isClicked,
                ),
              ),
              (Route<dynamic> route) => false,
            );
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 80,
              child: Image.asset(widget.imagePath),
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.play_circle_filled,
              color: Colors.black,
              size: 42,
            ),
          ],
        ),
      ),
    );
  }
}

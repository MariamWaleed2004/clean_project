import 'package:clean/const.dart';
import 'package:clean/features/presentation/widgets/from_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  bool _isUserReplaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text("Comments"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  sizeHor(10),
                  Text(
                    "username",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              sizeVer(10),
              Text(
                'This is very beautiful place',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
                ],
              ),
            ),
            sizeVer(10),
            Divider(
              color: secondaryColor,
            ),
            sizeVer(10),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    sizeHor(10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "username",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.favorite_outline,
                                  size: 20,  
                                  color: darkGreyColor,
                                ),
                              ],
                            ),
                            sizeVer(4),
                            Text(
                              'This is comment',
                              style: TextStyle(color: primaryColor),
                            ),
                            sizeVer(4),
                            Row(
                              children: [
                                Text(
                                  '08/07/2022',
                                  style:
                                      TextStyle(color: darkGreyColor, fontSize: 12),
                                ),
                                sizeHor(15),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isUserReplaying = !_isUserReplaying;
                                    });
                                  },
                                  child: Text(
                                    'Replay',
                                    style:
                                        TextStyle(color: darkGreyColor, fontSize: 12),
                                  ),
                                ),
                                sizeHor(15),
                                Text(
                                  'View Replays',
                                  style:
                                      TextStyle(color: darkGreyColor, fontSize: 12),
                                ),
                              ],
                            ),
                            _isUserReplaying == true? sizeVer(10) : sizeVer(0),
                            _isUserReplaying == true? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FormContainerWidget(hintText: "Post your replay"),
                                sizeVer(10),   
                                Text(
                                  'Post',
                                  style: TextStyle(color: blueColor),
                                )           
                               ],
                            ) : Container(width: 0, height: 0),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _commentSection(),
          ],
        ),
      
    );
  }

  _commentSection() {
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              sizeHor(10),
              Expanded(
                  child: TextFormField(
                style: TextStyle(color: primaryColor),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Post your comment...",
                    hintStyle: TextStyle(color: secondaryColor)),
              )),
              Text(
                "Post",
                style: TextStyle(fontSize: 15, color: blueColor),
              ),
            ],
          ),
      ),
      
    );
  }
}

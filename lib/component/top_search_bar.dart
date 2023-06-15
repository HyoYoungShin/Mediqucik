import 'package:flutter/material.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          //input text field
          Container(
            height: 35.0,
            width: MediaQuery.of(context).size.width - 65.0,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Colors.white,
                //labelText: 'Email',
              ),
            ),
          ),
          //search icon
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

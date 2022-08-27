import 'package:flutter/material.dart';

class TitleContainer extends StatefulWidget {
  final title;

  const TitleContainer({Key? key, this.title}) : super(key: key);

  @override
  State<TitleContainer> createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 10, right: 10, bottom: 10
      ),
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.menu,
                size: 50,),
              onPressed: (){}
          ),
          const SizedBox(width: 100,),

          Container(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: [
                 Text( widget.title, style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
                const SizedBox(width: 120),
                Stack(
                  children: [
                    Positioned(child: Container(
                      width: 30,
                      height: 30,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/profilePicture.jpeg'),
                      ),
                    ),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:magodo/pages/navigation_page/resident_navigation_page.dart';
import 'package:magodo/pages/profile_page/profile_page.dart';

class TitleContainer extends StatefulWidget {
  final data;
  final title;

  const TitleContainer({Key? key, this.title, required this.data}) : super(key: key);

  @override
  State<TitleContainer> createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
          left: 10, right: 10, bottom: 10
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.menu,
                    size: 50,),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  ResidentNavigationPage(data: widget.data,)));
                  }
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
                        Positioned(child: SizedBox(
                          width: 30,
                          height: 30,
                          child: InkWell(
                            onTap:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(data: widget.data,),
                                ),
                              );
                            },
                            child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profilePicture.jpeg'),
                          ),)
                        ),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:magodo/pages/navigation_page/resident_navigation_page.dart';

class GetPasscodeTitleContainer extends StatefulWidget {
  final data;
  final title;

  const GetPasscodeTitleContainer({Key? key, this.title, required this.data}) : super(key: key);

  @override
  State<GetPasscodeTitleContainer> createState() => _GetPasscodeTitleContainerState();
}

class _GetPasscodeTitleContainerState extends State<GetPasscodeTitleContainer> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
            bottom: 10
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
                        MaterialPageRoute(builder: (context) => ResidentNavigationPage(data: widget.data,)));
                  }
              ),
              const SizedBox(width: 91,),

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
                    const SizedBox(width: 80),
                    Stack(
                      children: const [
                        Positioned(child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
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
        ],
      ),
    );
  }
}
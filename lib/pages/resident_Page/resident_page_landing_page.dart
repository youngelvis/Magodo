import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:magodo/api/api.dart';
import 'package:magodo/components/filter_and_sort_buttons.dart';
import 'package:magodo/services/services.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;
import 'package:magodo/components/roundedTextSearchField.dart';
import 'package:magodo/components/title.dart';

class ResidentPageLandingPage extends StatefulWidget {
  final data;

  const ResidentPageLandingPage({Key? key, required this.data})
      : super(key: key);

  @override
  State<ResidentPageLandingPage> createState() =>
      _ResidentPageLandingPageState();
}

TextEditingController _searchWords = TextEditingController();

class _ResidentPageLandingPageState extends State<ResidentPageLandingPage> {


  _DataForVisitorCard() async {
    var data = await Services().viewSentPasscodeReport(
        "0", "2", widget.data['resident_code'], widget.data['zone']);

  }

  Widget _buildVisitorCard() {

    return Text('');
  }

  Widget _buildSearchBar() {
    return RoundedTextSearchField(
      hintText: 'Search',
      controller: _searchWords,
      icon: const Icon(Icons.search),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
            color: color.AppColor.homePageBackground,
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              children: [
                const TitleContainer(title: 'Dashboard'),
                Container(
                  color: color.AppColor.residentBody,
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
                  child: Column(children: [
                    _buildSearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    const FilterAndSortButtons(),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
                const Divider(
                  thickness: 2,
                ),
                // FutureBuilder(
                //   future: _getVisitor(),
                //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                //     if (snapshot.data == null) {
                //       return Container(
                //         child: const Center(
                //           child: Text('loading...'),
                //         ),
                //       );
                //     } else {
                //       return ListView.builder(
                //         itemBuilder: (BuildContext context, int index) {
                //           return ListTile(
                //             title: Text(snapshot.data[index].VISITOR_NAME),
                //           );
                //         },
                //         itemCount: snapshot.data.length,
                //       );
                //     }
                //   },
                // ),

              ],
            )),
      ),
    );
  }
}


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/data/data_source/remote_data_source.dart';
import 'package:rakna/presentation/screens/parking_detail.dart';

import '../../data/model/parking_model.dart';

class SearchUser extends SearchDelegate {
String image;

SearchUser({ this.image = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9FvFe1zRItStF3sa5SoJ6T9LihZcKSEGLdQ&usqp=CAU'});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
@override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.black);
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<ParkingModel>>(
        future: ParkingRemoteDataSource().getSearchResult(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ParkingModel>? data = snapshot.data;

          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingDetail1(parkId: snapshot.data![index].parkId, parkName: snapshot.data![index].parkName, parkLocation: snapshot.data![index].parkLocation, parkPrice: snapshot.data![index].parkPrice, parkImage: snapshot.data![index].parkImage)));
                  },
                  child: ListTile(
                    title: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(image,width: 60,height: 60,fit: BoxFit.fill,)),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data?[index].parkName}',
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${data?[index].parkLocation}',
                                    style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(height: 10.h),

                              ])
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Park'),
    );
  }
}
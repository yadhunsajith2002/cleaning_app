import 'package:cleaning_app/db/data_base.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  updateList(String value) {
    setState(() {
      searchServiceList = imagedatabse
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Search for services"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Popular services",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: searchServiceList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage(searchServiceList[index].imageUrl),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        searchServiceList[index].name,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}

import 'package:cleaning_app/db/service_db/data_base.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/compnay_details/company_details.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool onchanged = false;

  final searchController = TextEditingController();
  updateList(String value) {
    setState(() {
      searchServiceList = servicesData
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      onchanged = !onchanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CustumIcon(fontSize: 22),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: searchController,
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Search for services"),
              ),
              SizedBox(
                height: 20,
              ),
              searchController.text.isEmpty
                  ? Text(
                      "Popular services",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
              searchServiceList.length == 0
                  ? Center(
                      child: Text(
                        'Not found',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: searchServiceList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return CompanyDetails(
                                      index: index,
                                    );
                                  },
                                ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        searchServiceList[index].imageUrl),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    searchServiceList[index].name,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}

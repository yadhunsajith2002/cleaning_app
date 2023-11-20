import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/contract_details_screen/contract_details_screen.dart';
import 'package:cleaning_app/view/contract_details_screen/task_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  void initState() {
    super.initState();
    // Load contracts when the widget is initialized
    Provider.of<ContractController>(context, listen: false).loadContracts();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContractController>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CustumIcon(fontSize: 22),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Current Contracts",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: provider.serviceNames.length == 0
                          ? Center(
                              child: Text(
                                "No Contract yet",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 22),
                              ),
                            )
                          : ListView.builder(
                              itemCount: provider.serviceNames.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => TaskDetailsScreen(
                                          companyName: provider
                                              .serviceNames[index]
                                              .serviceProvider,
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  provider.serviceNames[index]
                                                      .servicename,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  provider.serviceNames[index]
                                                      .serviceProvider,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

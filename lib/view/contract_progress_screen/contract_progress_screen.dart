import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustumIcon(fontSize: 22),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: provider.serviceNames.length == 0
                ? Center(
                    child: Text(
                      "No Contract yet",
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                  )
                : ListView.builder(
                    itemCount: provider.serviceNames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.serviceNames[index].servicename,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    ),
                                    Text(
                                      provider
                                          .serviceNames[index].serviceProvider,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green),
                                    foregroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                  ),
                                  onPressed: () {
                                    // Handle button press
                                  },
                                  child: Text("Give Details"),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/model/contract_model/contract_model.dart';
import 'package:flutter/material.dart';
import 'package:cleaning_app/db/company_dv/company_db.dart';
import 'package:cleaning_app/db/service_db/data_base.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';

import 'package:provider/provider.dart';

class CompanyDetails extends StatefulWidget {
  CompanyDetails({super.key, required this.index});

  final int index;

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  String selectedCompany = '';
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContractController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: CustumIcon(fontSize: 20),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              " Top Companies for ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              // need to be handled there is an exception
              "${popularServices[widget.index].name}",
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: companyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCompany = companyData[index].companyName;
                        });
                      },
                      child: Card(
                        color: selectedCompany == companyData[index].companyName
                            ? Colors.green
                            : Colors.white,
                        child: ExpansionTile(
                          onExpansionChanged: (value) {
                            setState(() {
                              selectedCompany = companyData[index].companyName;
                            });
                          },
                          expandedAlignment: Alignment.topLeft,
                          childrenPadding: EdgeInsets.all(15),
                          title: Text(
                            companyData[index].companyName,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "One of the most popular company",
                            style: TextStyle(color: Colors.black),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location  :  ${companyData[index].Location}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Total Workers  :  ${companyData[index].totalWorkers}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Rating  : ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      " ${companyData[index].rating}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        selectedCompany.isNotEmpty
                            ? Colors.green
                            : Colors.grey),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () async {
                    if (selectedCompany.isNotEmpty) {
                      String serviceName = servicesData[widget.index].name;

                      // Check if the service is already in the list
                      bool serviceExists = provider.serviceNames.any(
                          (contract) =>
                              contract.servicename == serviceName &&
                              contract.serviceProvider == selectedCompany);

                      if (!serviceExists) {
                        // Add the service to the list using the ContractController
                        provider.addContract(ContractModel(
                          servicename: serviceName,
                          serviceProvider: selectedCompany,
                        ));

                        // Used SharedPreferences to save the list
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                          'contractDetails',
                          json.encode(provider.toJsonList()),
                        );
                      }
                    }
                    setState(() {
                      isTapped = true;
                    });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Contract Signed",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.done,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(selectedCompany.isNotEmpty
                      ? "Add to contract"
                      : "Add to contract"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

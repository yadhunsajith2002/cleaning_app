import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/db/workers_db/workers-db.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/model/workers_model/workers_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custum_card/custum_card.dart';

class ViewWorkersScreen extends StatelessWidget {
  ViewWorkersScreen({super.key, required this.companyName});

  final String companyName;

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ContractController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: CustumIcon(fontSize: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                companyName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                "Our Workers",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: workersDb.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: MediaQuery.of(context).size.height * 0.5,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return WorkersCustumCard(
                    index: index,
                    onAdd: () {
                      providerRead.addWorker(
                        WorkersData(
                          image: workersDb[index].image,
                          name: workersDb[index].name,
                          place: workersDb[index].place,
                          about: workersDb[index].name,
                          experiance: workersDb[index].experiance,
                        ),
                      );
                      print(providerRead.workersList.length);
                    },
                  );
                },
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Submit"),
        ),
      ),
    );
  }
}

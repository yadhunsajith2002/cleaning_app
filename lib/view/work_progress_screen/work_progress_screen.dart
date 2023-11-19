import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/contract_details_screen/contract_details_screen.dart';
import 'package:cleaning_app/view/work_progress_screen/progress_timeline/progress_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class WorkProgressScreen extends StatefulWidget {
  const WorkProgressScreen({super.key});

  @override
  State<WorkProgressScreen> createState() => _WorkProgressScreenState();
}

class _WorkProgressScreenState extends State<WorkProgressScreen> {
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
        backgroundColor: Colors.black,
        title: CustumIcon(fontSize: 22),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Active contracts",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: provider.serviceNames.length == 0
                ? Center(
                    child: Text(
                      "No Active contracts yet",
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                  )
                : ListView.builder(
                    itemCount: provider.serviceNames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.green, width: 7)),
                          child: ExpansionTile(
                            childrenPadding: EdgeInsets.all(20),
                            initiallyExpanded: true,
                            collapsedShape:
                                RoundedRectangleBorder(side: BorderSide.none),
                            shape:
                                RoundedRectangleBorder(side: BorderSide.none),
                            title: Text(
                              provider.serviceNames[index].servicename,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            subtitle: Text(
                              provider.serviceNames[index].serviceProvider,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CircularPercentIndicator(
                                center: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "50 % ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "completed",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                lineWidth: 15,
                                animation: true,
                                animationDuration: 5000,
                                progressColor: Colors.green,
                                percent: 0.5,
                                radius: 80,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProgressTimeLine(),
                                  ));
                                },
                                child: Text("View Progress"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
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

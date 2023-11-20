import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/global%20widgets/custom_icon.dart';
import 'package:cleaning_app/view/contract_details_screen/contract_details_screen.dart';
import 'package:cleaning_app/view/work_progress_screen/progress_timeline/progress_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Active contracts",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                AvatarGlow(
                    duration: Duration(milliseconds: 2000),
                    glowColor: Colors.green,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green.shade400,
                    ),
                    endRadius: 25)
              ],
            ),
            SizedBox(
              height: 10,
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
                                "No Active contracts yet",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 22),
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
                                      // border: Border.all(color: Colors.green, width: 7),
                                    ),
                                    child: ExpansionTile(
                                      childrenPadding: EdgeInsets.all(20),
                                      initiallyExpanded: false,
                                      collapsedShape: RoundedRectangleBorder(
                                          side: BorderSide.none),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide.none),
                                      title: Text(
                                        provider
                                            .serviceNames[index].servicename,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                      subtitle: Text(
                                        provider.serviceNames[index]
                                            .serviceProvider,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20),
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
                                                "Work in ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "progress",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          lineWidth: 15,
                                          animation: true,
                                          animationDuration: 5000,
                                          progressColor: Colors.green,
                                          percent: 0.5,
                                          radius: 80,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.green),
                                            foregroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  ProgressTimeLine(),
                                            ));
                                          },
                                          child: Text("View"),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

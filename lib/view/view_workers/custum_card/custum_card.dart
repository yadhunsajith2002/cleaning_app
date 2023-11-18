import 'package:cleaning_app/model/workers_model/workers_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/contractDetails/contract_controller.dart';
import '../../../db/workers_db/workers-db.dart';

class WorkersCustumCard extends StatefulWidget {
  WorkersCustumCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<WorkersCustumCard> createState() => _WorkersCustumCardState();
}

class _WorkersCustumCardState extends State<WorkersCustumCard> {
  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ContractController>();
    final isAdded = providerRead.isWorkerAddedByIndex(widget.index);

    return Card(
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(workersDb[widget.index].image),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      workersDb[widget.index].name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      workersDb[widget.index].place,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        workersDb[widget.index].about,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      " Experience: ${workersDb[widget.index].experiance.toString()} yr",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isAdded
                        ? MaterialStatePropertyAll(Colors.grey.shade500)
                        : MaterialStatePropertyAll(Colors.green),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    if (isAdded) {
                      providerRead.removeWorkerByIndex(widget.index);
                    } else {
                      providerRead.addWorker(
                        WorkersData(
                          image: workersDb[widget.index].image,
                          name: workersDb[widget.index].name,
                          place: workersDb[widget.index].place,
                          about: workersDb[widget.index].about,
                          experiance: workersDb[widget.index].experiance,
                        ),
                      );
                    }
                    print(providerRead.workersList.length);
                  },
                  child: Text(isAdded ? "Remove" : "Add"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cleaning_app/controller/contractDetails/contract_controller.dart';
import 'package:cleaning_app/db/workers_db/workers-db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkersCustumCard extends StatelessWidget {
  WorkersCustumCard({
    super.key,
    required this.index,
    required this.onAdd,
  });

  final int index;

  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<ContractController>();
    final providerRead = context.read<ContractController>();

    return Card(
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(workersDb[index].image)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  workersDb[index].name,
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
                  workersDb[index].place,
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
                    workersDb[index].about,
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
                  " Experainace : ${workersDb[index].experiance.toString()} yr",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    onAdd();
                  },
                  child: Text(providerRead.isAdded ? "Added" : "Add"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

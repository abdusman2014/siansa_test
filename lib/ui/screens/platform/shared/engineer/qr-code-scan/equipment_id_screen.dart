import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/routes_constants.dart';
import 'package:siansa_app/models/app/equipment_model.dart';
import 'package:go_router/go_router.dart';
import 'package:siansa_app/state/providers/equipment_provider/equipment_provider.dart';

class EquipmentIdScreen extends StatefulWidget {
  const EquipmentIdScreen({super.key, required this.id});
  final String id;

  @override
  State<EquipmentIdScreen> createState() => _EquipmentIdScreenState();
}

class _EquipmentIdScreenState extends State<EquipmentIdScreen> {
  Future<EquipmentModel> getEquipmentDetails() async {
    final equipmentProvider =
        Provider.of<EquipmentProvider>(context, listen: false);
    EquipmentModel result =
        await equipmentProvider.crud.readOneById(context, widget.id);
    print(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/equipment.png",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "Equipment Id",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              widget.id,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Set the background color to red
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              EquipmentModel equipmentDetails = await getEquipmentDetails();
              context.go(RoutesConstants.EQUIPMENT_DETAIL_SCREEN,
                  extra: equipmentDetails);
            },
            child: Text("Check Equipment Details"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:siansa_app/models/app/equipment_model.dart';

class EquipmentDetailScreen extends StatelessWidget {
  EquipmentDetailScreen({super.key, required this.data});
  EquipmentModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white),
                      ),
                      Text(
                        data.categoryIds[0],
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fill out report",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Today is Tuesday, Jan 3 2024",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                EquipmentDetailsScreenWidget(
                  heading: "Weekly Inspection",
                  description:
                      "Lorem ipsum dolor sit amet consectetur. Gravida aliquet lacus faucibus turpis sit aenean.",
                  onTapStart: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                EquipmentDetailsScreenWidget(
                  heading: "Monthly Maintenance",
                  description:
                      "Lorem ipsum dolor sit amet consectetur. Gravida aliquet lacus faucibus turpis sit aenean.",
                  onTapStart: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EquipmentDetailsScreenWidget extends StatelessWidget {
  const EquipmentDetailsScreenWidget(
      {super.key,
      required this.description,
      required this.heading,
      required this.onTapStart});
  final String heading;
  final String description;
  final VoidCallback onTapStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xFF5A7084), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTapStart,
                child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Start",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF5A7084)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

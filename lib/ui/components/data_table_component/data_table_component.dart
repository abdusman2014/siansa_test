// import 'package:flutter/material.dart';

// class DataTableComponent extends StatelessWidget {
//   final List<Map<String, dynamic>> data;

//   DataTableComponent({required this.data});

//   void _onEdit(Map<String, dynamic> row) {
//     print("Edit: ${row['id']}");
//     // Implement edit logic
//   }

//   void _onDelete(Map<String, dynamic> row) {
//     print("Delete: ${row['id']}");
//     // Implement delete logic
//   }

//   void _onPreview(Map<String, dynamic> row) {
//     print("Preview: ${row['id']}");
//     // Implement preview logic
//   }

//   void _onShare(Map<String, dynamic> row) {
//     print("Share: ${row['id']}");
//     // Implement share logic
//   }

//   void _onDownload(Map<String, dynamic> row) {
//     print("Download: ${row['id']}");
//     // Implement download logic (PDF or CSV)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('DataTable with Actions')),
//       body: SingleChildScrollView(
//         child: DataTable(
//           columns: [
//             DataColumn(label: Text('ID')),
//             DataColumn(label: Text('Name')),
//             DataColumn(label: Text('Email')),
//             DataColumn(label: Text('Actions')),
//           ],
//           rows: data.map((row) {
//             return DataRow(cells: [
//               DataCell(Text(row['id'].toString())),
//               DataCell(Text(row['name'])),
//               DataCell(Text(row['email'])),
//               DataCell(Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () => _onEdit(row),
//                     tooltip: 'Edit',
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => _onDelete(row),
//                     tooltip: 'Delete',
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.visibility),
//                     onPressed: () => _onPreview(row),
//                     tooltip: 'Preview',
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.share),
//                     onPressed: () => _onShare(row),
//                     tooltip: 'Share',
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.download),
//                     onPressed: () => _onDownload(row),
//                     tooltip: 'Download',
//                   ),
//                 ],
//               )),
//             ]);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class DataTableComponent extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  DataTableComponent({required this.data});

  void _onPreview(Map<String, dynamic> row) {
    print("Preview: ${row['id']}");
    // Implement preview logic
  }

  void _onEdit(Map<String, dynamic> row) {
    print("Edit: ${row['id']}");
    // Implement edit logic
  }

  void _onDelete(Map<String, dynamic> row) {
    print("Delete: ${row['id']}");
    // Implement delete logic
  }

  void _onShare(Map<String, dynamic> row) {
    print("Share: ${row['id']}");
    // Implement share logic
  }

  void _onDownload(Map<String, dynamic> row) {
    print("Download: ${row['id']}");
    // Implement download logic (PDF or CSV)
  }

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 3,
      minWidth: 30,
      columns: const [
        DataColumn2(label: Text('ID'), size: ColumnSize.S),
        DataColumn2(label: Text('Name'), size: ColumnSize.S),
        DataColumn2(label: Text('Email'), size: ColumnSize.S),
        DataColumn2(label: Text('Actions'), size: ColumnSize.S),
      ],
      rows: data.map((row) {
        return DataRow(cells: [
          DataCell(Text(row['id'].toString())),
          DataCell(Text(row['name'])),
          DataCell(Text(row['email'])),
          DataCell(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.visibility, color: Colors.green),
                onPressed: () => _onPreview(row),
                tooltip: 'Preview',
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () => _onEdit(row),
                tooltip: 'Edit',
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _onDelete(row),
                tooltip: 'Delete',
              ),
              IconButton(
                icon: Icon(Icons.share, color: Colors.orange),
                onPressed: () => _onShare(row),
                tooltip: 'Share',
              ),
              IconButton(
                icon: Icon(Icons.download, color: Colors.purple),
                onPressed: () => _onDownload(row),
                tooltip: 'Download',
              ),
            ],
          )),
        ]);
      }).toList(),
    );

    return Scaffold(
      appBar: AppBar(title: Text('DataTable2 with Actions')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable2(
          columnSpacing: 12,
          minWidth: 600,
          columns: [
            DataColumn2(label: Text('ID'), size: ColumnSize.S),
            DataColumn2(label: Text('Name'), size: ColumnSize.L),
            DataColumn2(label: Text('Email'), size: ColumnSize.L),
            DataColumn2(label: Text('Actions'), size: ColumnSize.S),
          ],
          rows: data.map((row) {
            return DataRow(cells: [
              DataCell(Text(row['id'].toString())),
              DataCell(Text(row['name'])),
              DataCell(Text(row['email'])),
              DataCell(Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _onEdit(row),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _onDelete(row),
                    tooltip: 'Delete',
                  ),
                  IconButton(
                    icon: Icon(Icons.visibility, color: Colors.green),
                    onPressed: () => _onPreview(row),
                    tooltip: 'Preview',
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.orange),
                    onPressed: () => _onShare(row),
                    tooltip: 'Share',
                  ),
                  IconButton(
                    icon: Icon(Icons.download, color: Colors.purple),
                    onPressed: () => _onDownload(row),
                    tooltip: 'Download',
                  ),
                ],
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

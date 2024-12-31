// IMPROVEMENTS:
// - Let it accept an actions List of Maps, where each map contains keys:
// icon widget, title string, on click callback function (row).

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class DataTableComponent extends StatelessWidget {
  final List<Map<String, dynamic>>? data;
  final Map<String, dynamic>? columnsDisplayText;
  final List<String> visibleColumns;

  // final List<DataColumn>? columns;
  // final List<DataRow>? rows;

  final double columnSpacing;
  final double minWidth;

  final bool isPreviewEnabled;
  final bool isEditEnabled;
  final bool isDeleteEnabled;
  final bool isShareEnabled;
  final bool isDownloadEnabled;
  final bool isDownloadPDFEnabled;
  final bool isDownloadCSVEnabled;

  final TextStyle columnTextStyle;

  // Define callback functions for each action
  final Function(Map<String, dynamic>)? onPreview;
  final Function(Map<String, dynamic>)? onEdit;
  final Function(Map<String, dynamic>)? onDelete;
  final Function(Map<String, dynamic>)? onShare;
  final Function(Map<String, dynamic>)? onDownload;
  final Function(Map<String, dynamic>)? onDownloadPDF;
  final Function(Map<String, dynamic>)? onDownloadCSV;

  const DataTableComponent({
    Key? key,
    this.data,
    this.columnsDisplayText,
    this.visibleColumns = const [],
    //
    // this.columns,
    // this.rows,
    //
    this.columnSpacing = 3,
    this.minWidth = 30,
    //
    this.isPreviewEnabled = true,
    this.isEditEnabled = true,
    this.isDeleteEnabled = true,
    this.isShareEnabled = true,
    this.isDownloadEnabled = true,
    this.isDownloadPDFEnabled = true,
    this.isDownloadCSVEnabled = true,
    //
    this.columnTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    //
    this.onPreview,
    this.onEdit,
    this.onDelete,
    this.onShare,
    this.onDownload,
    this.onDownloadPDF,
    this.onDownloadCSV,
  }) : super(key: key);

  void _onPreview(Map<String, dynamic> row) {
    if (onPreview != null) {
      onPreview!(row);
    } else {
      print("Preview: ${row['id']}");
    }
  }

  void _onEdit(Map<String, dynamic> row) {
    if (onEdit != null) {
      onEdit!(row);
    } else {
      print("Edit: ${row['id']}");
    }
  }

  void _onDelete(Map<String, dynamic> row) {
    if (onDelete != null) {
      onDelete!(row);
    } else {
      print("Delete: ${row['id']}");
    }
  }

  void _onShare(Map<String, dynamic> row) {
    if (onShare != null) {
      onShare!(row);
    } else {
      print("Share: ${row['id']}");
    }
  }

  void _onDownload(Map<String, dynamic> row) {
    if (onDownload != null) {
      onDownload!(row);
    } else {
      print("Download: ${row['id']}");
    }
  }

  void _onDownloadPDF(Map<String, dynamic> row) {
    if (onDownloadPDF != null) {
      onDownloadPDF!(row);
    } else {
      print("DownloadPDF: ${row['id']}");
    }
  }

  void _onDownloadCSV(Map<String, dynamic> row) {
    if (onDownloadCSV != null) {
      onDownloadCSV!(row);
    } else {
      print("DownloadCSV: ${row['id']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data == null || data!.isEmpty) {
      return const Center(child: Text("No data available"));
    }

    // **************************************************
    // COLUMNS
    // **************************************************

    final columns = (visibleColumns.isEmpty
            ? data!.first.keys // If visibleColumns is empty, get all keys
            : data!.first.keys
                .where((key) => visibleColumns.contains(key.toString())))
        .map((key) {
      return DataColumn2(
        label: Text(
          columnsDisplayText![key] ?? key.toUpperCase(),
          style: columnTextStyle,
        ),
        size: ColumnSize.S,
      );
    }).toList();

    // Add the "Actions" column at the end
    columns.add(
      DataColumn2(
        label: Text(
          'Actions',
          style: columnTextStyle,
        ),
        size: ColumnSize.S,
      ),
    );

    // **************************************************
    // ROWS
    // **************************************************

    // Generate rows with an additional DataCell for "Actions" for each row
    final rows = data!.map((row) {
      // Create DataCells for each data value in the row
      final cells = (visibleColumns.isEmpty
              ? row.entries // If visibleColumns is empty, include all entries
              : row.entries.where(
                  (entry) => visibleColumns.contains(entry.key.toString())))
          .map((entry) {
        return DataCell(Text(entry.value.toString()));
      }).toList();

      // Add an additional DataCell for the "Actions" column
      cells.add(
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (isPreviewEnabled)
                IconButton(
                  icon: const Icon(Icons.visibility,
                      color: Color.fromARGB(255, 8, 115, 203)),
                  onPressed: () => _onPreview(row),
                  tooltip: 'Preview',
                ),
              if (isEditEnabled)
                IconButton(
                  icon: const Icon(Icons.edit,
                      color: Color.fromARGB(255, 33, 215, 243)),
                  onPressed: () => _onEdit(row),
                  tooltip: 'Edit',
                ),
              if (isDeleteEnabled)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _onDelete(row),
                  tooltip: 'Delete',
                ),
              if (isShareEnabled)
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.orange),
                  onPressed: () => _onShare(row),
                  tooltip: 'Share',
                ),
              if (isDownloadEnabled)
                IconButton(
                  icon: const Icon(Icons.download, color: Colors.purple),
                  onPressed: () => _onDownload(row),
                  tooltip: 'Download',
                ),
              if (isDownloadPDFEnabled)
                IconButton(
                  icon: const Icon(Icons.adobe,
                      color: Color.fromARGB(255, 168, 4, 4)),
                  onPressed: () => _onDownloadPDF(row),
                  tooltip: 'Download PDF',
                ),
              if (isDownloadCSVEnabled)
                IconButton(
                  icon: const Icon(Icons.tab,
                      color: Color.fromARGB(255, 4, 168, 64)),
                  onPressed: () => _onDownloadCSV(row),
                  tooltip: 'Download CDV',
                ),
            ],
          ),
        ),
      );

      return DataRow(cells: cells);
    }).toList();

    // **************************************************
    // DATA TABLE 2
    // **************************************************

    return DataTable2(
      columnSpacing: columnSpacing,
      minWidth: minWidth,
      columns: columns,
      rows: rows,
      horizontalMargin: 12,
      dividerThickness: 1,
    );
  }
}

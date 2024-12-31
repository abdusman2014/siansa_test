// import 'package:flutter/material.dart';
// import 'package:data_table_2/data_table_2.dart';

// import 'package:siansa_app/ui/components/crud_component/data_table_component.dart';
// import 'package:siansa_app/ui/components/crud_component/widgets/alert_confirm.dart';
// import 'package:siansa_app/ui/components/crud_component/widgets/alert_content.dart';
// import 'package:siansa_app/ui/components/crud_component/widgets/alert_dialog_fullscreen.dart';
// import 'package:siansa_app/ui/components/crud_component/widgets/alert_info.dart';
// import 'package:siansa_app/ui/components/crud_component/widgets/order_by_button.dart';

// import './widgets/title_text.dart';
// import './widgets/create_button.dart';
// import './widgets/search_text_field.dart';
// import './widgets/search_button.dart';
// import './widgets/search_filters_button.dart';
// import './widgets/pagination_button.dart';

// class CrudComponent extends StatefulWidget {
//   // Data variables
//   final String title;
//   final Map<String, dynamic> columnsText;
//   final List<Map<String, dynamic>> data;
//   final bool isProcessing;
//   // External callback variables
//   // final VoidCallback onCreate;
//   //
//   final Function(String) onSearch;
//   final VoidCallback onPreviousPage;
//   final VoidCallback onNextPage;
//   //
//   final VoidCallback onFilter;
//   final VoidCallback onOrderBy;
//   //
//   // final VoidCallback onUpdate;
//   //
//   // final VoidCallback onDelete;
//   //
//   // final VoidCallback onActionExportPDF;
//   // final VoidCallback onActionExportCSV;
//   // final VoidCallback onActionImportCSV;
//   //
//   // External widgets
//   final Widget? createFormWidget;
//   final Widget? readContentWidget;
//   final Widget? filterFormWidget;
//   final Widget? orderByFormWidget;
//   final Widget? updateFormWidget;

//   final String alertCreateTitle;
//   final String alertReadTitle;
//   final String alertFilterTitle;
//   final String alertOrderByTitle;
//   final String alertUpdateTitle;
//   final String alertDeleteTitle;

//   final Widget? alertCreateTitleTextWidget;
//   final Widget? alertReadTitleTextWidget;
//   final Widget? alertFilterTitleTextWidget;
//   final Widget? alertOrderByTitleTextWidget;
//   final Widget? alertUpdateTitleTextWidget;
//   final Widget? alertDeleteTitleTextWidget;

//   final bool isSearchKeywordRequiredToFilterSearch;
//   final bool isSearchKeywordRequiredToOrderSearchResults;

//   const CrudComponent({
//     Key? key,
//     this.title = "Title",
//     this.columnsText = const {},
//     this.data = const [],
//     this.isProcessing = false,
//     //
//     // this.onCreate = _defaultPreviousPage,
//     //
//     required this.onSearch,
//     this.onPreviousPage = _defaultPreviousPage,
//     this.onNextPage = _defaultNextPage,
//     //
//     this.onFilter = _defaultFilter,
//     this.onOrderBy = _defaultOrderBy,
//     //
//     // this.onUpdate = _defaultOrderBy,
//     //
//     // this.onDelete = _defaultOrderBy,
//     //
//     // this.onActionExportPDF = _defaultOrderBy,
//     // this.onActionExportCSV = _defaultOrderBy,
//     // this.onActionImportCSV = _defaultOrderBy,
//     //
//     this.createFormWidget,
//     this.readContentWidget,
//     this.filterFormWidget,
//     this.orderByFormWidget,
//     this.updateFormWidget,
//     //
//     this.alertCreateTitle = 'Create Title',
//     this.alertReadTitle = 'Read Title',
//     this.alertFilterTitle = 'Filter Search Title',
//     this.alertOrderByTitle = 'Order By Title',
//     this.alertUpdateTitle = 'Update Title',
//     this.alertDeleteTitle = 'Delete Title',
//     //
//     this.alertCreateTitleTextWidget,
//     this.alertReadTitleTextWidget,
//     this.alertFilterTitleTextWidget,
//     this.alertOrderByTitleTextWidget,
//     this.alertUpdateTitleTextWidget,
//     this.alertDeleteTitleTextWidget,
//     //
//     this.isSearchKeywordRequiredToFilterSearch = false,
//     this.isSearchKeywordRequiredToOrderSearchResults = false,
//   }) : super(key: key);

//   // Default implementations for the callbacks

//   static void _defaultPreviousPage() {
//     print("Previous page (default)");
//   }

//   static void _defaultNextPage() {
//     print("Next page (default)");
//   }

//   static void _defaultFilter() {
//     print("Filter button clicked (default)");
//   }

//   static void _defaultOrderBy() {
//     print("OrderBy button clicked (default)");
//   }

//   @override
//   _CrudComponentState createState() => _CrudComponentState();
// }

// class _CrudComponentState extends State<CrudComponent> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // Listen for changes in the TextField input
//     _searchController.addListener(() {
//       print("Current text: ${_searchController.text}");
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   _handleSearch(BuildContext context) {
//     if (_searchController.text.isEmpty) {
//       _showInfoMessageDialog(context);
//     }
//     widget.onSearch(_searchController.text);
//   }

//   _handleFilterSearch(BuildContext context) {
//     if (widget.isSearchKeywordRequiredToFilterSearch &&
//         _searchController.text.isEmpty) {
//       _showInfoMessageDialog(context);
//     } else {
//       _showFiltersDialog(context);
//     }
//   }

//   _handleOrderBy(BuildContext context) {
//     if (widget.isSearchKeywordRequiredToOrderSearchResults &&
//         _searchController.text.isEmpty) {
//       _showInfoMessageDialog(context);
//     } else {
//       _showOrderByDialog(context);
//     }
//   }

//   _handleCreate(BuildContext context) {
//     _showCreateDialog(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // If processing, show the non-dismissible dialog
//     if (widget.isProcessing) {
//       return _showProcessingDialog(context);
//     }

//     // Main content of the widget
//     return Container(
//       margin: const EdgeInsets.all(15),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // --------------------------------------------------
//           // TITLE AND CREATE BUTTON
//           // --------------------------------------------------
//           Row(
//             children: [
//               TitleText(title: widget.title),
//               const SizedBox(width: 8),
//               CreateButton(onPressed: () => _handleCreate(context)),
//             ],
//           ),
//           // --------------------------------------------------
//           // SEARCH INPUT AND SEARCH FILTER ORDER BUTTONS
//           // --------------------------------------------------
//           const SizedBox(height: 16),
//           if (widget.data.isNotEmpty &&
//               widget.data != null &&
//               ResponsiveCRUDComponent.isMobile(context) == true)
//             Row(
//               children: [
//                 Expanded(
//                   child: SearchTextField(
//                     controller: _searchController,
//                     onSubmitted: (value) => _handleSearch(context),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SearchButton(
//                   onPressed: () => _handleSearch(context),
//                 ),
//               ],
//             ),
//           if (widget.data.isNotEmpty &&
//               widget.data != null &&
//               ResponsiveCRUDComponent.isMobile(context) == true)
//             const SizedBox(height: 16),
//           if (widget.data.isNotEmpty &&
//               widget.data != null &&
//               ResponsiveCRUDComponent.isMobile(context) == true)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SearchFiltersButton(
//                   onPressed: () => _handleFilterSearch(context),
//                 ),
//                 const SizedBox(width: 8),
//                 OrderByButton(
//                   onPressed: () => _handleOrderBy(context),
//                 ),
//               ],
//             ),
//           if (widget.data.isNotEmpty &&
//               widget.data != null &&
//               ResponsiveCRUDComponent.isMobile(context) == false)
//             Row(
//               children: [
//                 Expanded(
//                   child: SearchTextField(
//                     controller: _searchController,
//                     onSubmitted: (value) => _handleSearch(context),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SearchButton(
//                   onPressed: () => _handleSearch(context),
//                 ),
//                 const SizedBox(width: 8),
//                 SearchFiltersButton(
//                   onPressed: () => _handleFilterSearch(context),
//                 ),
//                 const SizedBox(width: 8),
//                 OrderByButton(
//                   onPressed: () => _handleOrderBy(context),
//                 ),
//               ],
//             ),
//           // --------------------------------------------------
//           // DATA TABLE
//           // --------------------------------------------------
//           const SizedBox(height: 16),
//           if (widget.data.isEmpty || widget.data == null)
//             const Expanded(
//               child: Center(
//                 child: Text('No Data :('),
//               ),
//             ),
//           if (widget.data.isNotEmpty && widget.data != null)
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12.0),
//                   border: Border.all(
//                     color: Colors.grey.shade100,
//                     width: 1,
//                   ),
//                 ),
//                 // ------------------------------
//                 // child: DataTable2(
//                 //   columnSpacing: 3,
//                 //   minWidth: 30,
//                 //   columns: widget.data.isNotEmpty
//                 //       ? widget.data.first.keys.map((key) {
//                 //           return DataColumn2(
//                 //             label: Text(
//                 //               widget.columnsText[key] ??
//                 //                   key.toUpperCase(), // key.toUpperCase(),
//                 //               style: const TextStyle(
//                 //                 color: Colors.green,
//                 //                 fontWeight: FontWeight.bold,
//                 //               ),
//                 //             ),
//                 //             size: ColumnSize.S,
//                 //           );
//                 //         }).toList()
//                 //       : [],
//                 //   rows: widget.data.map((row) {
//                 //     return DataRow(
//                 //       cells: row.values.map((value) {
//                 //         return DataCell(Text(value.toString()));
//                 //       }).toList(),
//                 //     );
//                 //   }).toList(),
//                 // ),
//                 // ------------------------------
//                 // child: DataTableComponent(
//                 //   columnSpacing: 3,
//                 //   minWidth: 30,
//                 //   columns: widget.data.isNotEmpty
//                 //       ? widget.data.first.keys.map((key) {
//                 //           return DataColumn2(
//                 //             label: Text(
//                 //               widget.columnsText[key] ??
//                 //                   key.toUpperCase(), // key.toUpperCase(),
//                 //               style: const TextStyle(
//                 //                 color: Colors.green,
//                 //                 fontWeight: FontWeight.bold,
//                 //               ),
//                 //             ),
//                 //             size: ColumnSize.S,
//                 //           );
//                 //         }).toList()
//                 //       : [],
//                 //   rows: widget.data.map((row) {
//                 //     return DataRow(
//                 //       cells: row.values.map((value) {
//                 //         return DataCell(Text(value.toString()));
//                 //       }).toList(),
//                 //     );
//                 //   }).toList(),
//                 // ),
//                 // ------------------------------
//                 child: DataTableComponent(
//                   columnSpacing: 3,
//                   minWidth: 30,
//                   data: widget.data,
//                   // columns: widget.data.isNotEmpty
//                   //     ? widget.data.first.keys.map((key) {
//                   //         return DataColumn2(
//                   //           label: Text(
//                   //             widget.columnsText[key] ??
//                   //                 key.toUpperCase(), // key.toUpperCase(),
//                   //             style: const TextStyle(
//                   //               color: Colors.green,
//                   //               fontWeight: FontWeight.bold,
//                   //             ),
//                   //           ),
//                   //           size: ColumnSize.S,
//                   //         );
//                   //       }).toList()
//                   //     : [],
//                   // rows: widget.data.map((row) {
//                   //   return DataRow(
//                   //     cells: row.values.map((value) {
//                   //       return DataCell(Text(value.toString()));
//                   //     }).toList(),
//                   //   );
//                   // }).toList(),
//                 ),
//                 // ------------------------------
//                 // ------------------------------
//               ),
//             ),
//           // --------------------------------------------------
//           // PAGiNATION BUTTONS
//           // --------------------------------------------------
//           const SizedBox(height: 16),
//           if (widget.data.isNotEmpty && widget.data != null)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 PaginationButton(
//                   text: 'Previous',
//                   // onPressed: () => _handlePreviousPage(),
//                   onPressed: widget.onPreviousPage,
//                   isDisabled: false, // or true to disable
//                 ),
//                 PaginationButton(
//                   text: 'Next',
//                   // onPressed: () => _handlePreviousPage(),
//                   onPressed: widget.onNextPage,
//                   isDisabled: false, // or true to disable
//                 ),
//               ],
//             ),
//           // --------------------------------------------------
//         ],
//       ),
//     );
//   }

//   Widget _showProcessingDialog(BuildContext context) {
//     return const Center(
//       child: CircularProgressIndicator(
//         color: Colors.green, // Set the color
//         strokeWidth: 6.0, // Adjust thickness
//       ),
//     );
//   }

//   void _showInfoMessageDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return const AlertInfo(
//           infoText: 'Please enter some text to search',
//         );
//       },
//     );
//   }

//   void _showCreateDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialogFullscreen(
//           titleText: widget.alertCreateTitle,
//           titleTextWidget: widget.alertCreateTitleTextWidget,
//           contentWidget: SingleChildScrollView(
//                 child: widget.createFormWidget,
//               ) ??
//               const Center(
//                 child: Text('NO widget.createFormWidget'),
//               ),
//         );
//       },
//       barrierDismissible: false, // Prevent dismiss by tapping outside
//     );
//   }

//   void _showReadDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialogFullscreen(
//           titleText: widget.alertReadTitle,
//           contentWidget: SingleChildScrollView(
//             child: widget.readContentWidget ??
//                 const Center(
//                   child: Text('NO widget.readContentWidget'),
//                 ),
//           ),
//         );
//       },
//       barrierDismissible: false, // Prevent dismiss by tapping outside
//     );
//   }

//   void _showFiltersDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertContent(
//           titleText: widget.alertFilterTitle,
//           titleTextWidget: widget.alertFilterTitleTextWidget,
//           contentWidget: widget.filterFormWidget ??
//               const Text('NO widget.filterFormWidget'),
//         );
//       },
//     );
//   }

//   void _showOrderByDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertContent(
//           titleText: widget.alertOrderByTitle,
//           titleTextWidget: widget.alertOrderByTitleTextWidget,
//           contentWidget: widget.orderByFormWidget ??
//               const Text('NO widget.orderByFormWidget'),
//         );
//       },
//     );
//   }

//   void _showUpdateDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialogFullscreen(
//           titleText: widget.alertUpdateTitle,
//           contentWidget: widget.updateFormWidget ??
//               const Center(
//                 child: Text('NO widget.updateFormWidget'),
//               ),
//         );
//       },
//       barrierDismissible: false, // Prevent dismiss by tapping outside
//     );
//   }

//   void _showDeleteDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertConfirm(
//           text: 'Are you sure?',
//           onConfirm: () => print('oh no'),
//         );
//       },
//     );
//   }
// }

// class ResponsiveCRUDComponent {
//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 850;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < 1100 &&
//       MediaQuery.of(context).size.width >= 850;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1100;
// }

import 'package:flutter/material.dart';

import 'package:siansa_app/ui/components/crud_component/data_table_component.dart';
import 'package:siansa_app/ui/components/crud_component/widgets/alert_confirm.dart';
import 'package:siansa_app/ui/components/crud_component/widgets/alert_content.dart';
import 'package:siansa_app/ui/components/crud_component/widgets/alert_dialog_fullscreen.dart';
import 'package:siansa_app/ui/components/crud_component/widgets/alert_info.dart';
import 'package:siansa_app/ui/components/crud_component/widgets/order_by_button.dart';

import './widgets/title_text.dart';
import './widgets/create_button.dart';
import './widgets/search_text_field.dart';
import './widgets/search_button.dart';
import './widgets/search_filters_button.dart';
import './widgets/pagination_button.dart';

class CrudComponent extends StatefulWidget {
  // **************************************************
  // DATA
  // **************************************************

  final String title;
  final List<Map<String, dynamic>> data;
  final Map<String, dynamic> columnsDisplayText;
  final List<String> visibleColumns;

  // **************************************************
  // CALLBACKS
  // **************************************************

  final Function(String) onSearch;
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;

  final Function(String)? onDelete;
  final Function(Map<String, dynamic>)? onShare;
  final Function(Map<String, dynamic>)? onDownload;
  final Function(Map<String, dynamic>)? onDownloadPDF;
  final Function(Map<String, dynamic>)? onDownloadCSV;

  // **************************************************
  // WIDGETS
  // **************************************************

  final Function()? createFormWidget;
  final Function(Map<String, dynamic> data)? readContentWidget;
  final Widget? filterFormWidget;
  final Widget? orderByFormWidget;
  final Function(Map<String, dynamic> data)? updateFormWidget;

  // **************************************************
  // TEXT STRINGS
  // **************************************************

  final String alertCreateTitle;
  final String alertReadTitle;
  final String alertFilterTitle;
  final String alertOrderByTitle;
  final String alertUpdateTitle;
  final String alertDeleteTitle;
  final String alertDeleteMessage;

  // **************************************************
  // TEXT WIDGETS
  // **************************************************

  final Widget? alertCreateTitleTextWidget;
  final Widget? alertReadTitleTextWidget;
  final Widget? alertFilterTitleTextWidget;
  final Widget? alertOrderByTitleTextWidget;
  final Widget? alertUpdateTitleTextWidget;
  final Widget? alertDeleteTitleTextWidget;
  final Widget? alertDeleteMessageTextWidget;

  // **************************************************
  // FLAGS
  // **************************************************

  final bool isProcessing;
  final bool isSearchKeywordRequiredToFilterSearch;
  final bool isSearchKeywordRequiredToOrderSearchResults;

  final bool isPreviewEnabled;
  final bool isEditEnabled;
  final bool isDeleteEnabled;
  final bool isShareEnabled;
  final bool isDownloadEnabled;
  final bool isDownloadPDFEnabled;
  final bool isDownloadCSVEnabled;

  // **************************************************
  // CONSTRUCTOR
  // **************************************************

  const CrudComponent({
    Key? key,
    this.title = "Title",
    this.data = const [],
    this.columnsDisplayText = const {},
    this.visibleColumns = const [],
    //
    // this.onCreate = _defaultPreviousPage,
    //
    required this.onSearch,
    this.onNextPage = _defaultNextPage,
    this.onPreviousPage = _defaultPreviousPage,
    //
    this.onDelete,
    this.onShare,
    this.onDownload,
    this.onDownloadPDF,
    this.onDownloadCSV,
    //
    this.createFormWidget,
    this.readContentWidget,
    this.filterFormWidget,
    this.orderByFormWidget,
    this.updateFormWidget,
    //
    this.alertCreateTitle = 'Create Title',
    this.alertReadTitle = 'Read Title',
    this.alertFilterTitle = 'Filter Search Title',
    this.alertOrderByTitle = 'Order By Title',
    this.alertUpdateTitle = 'Update Title',
    this.alertDeleteTitle = 'Delete Title',
    this.alertDeleteMessage = 'Delete message here...',
    //
    this.alertCreateTitleTextWidget,
    this.alertReadTitleTextWidget,
    this.alertFilterTitleTextWidget,
    this.alertOrderByTitleTextWidget,
    this.alertUpdateTitleTextWidget,
    this.alertDeleteTitleTextWidget,
    this.alertDeleteMessageTextWidget,
    //
    this.isProcessing = false,
    this.isSearchKeywordRequiredToFilterSearch = false,
    this.isSearchKeywordRequiredToOrderSearchResults = false,
    //
    this.isPreviewEnabled = true,
    this.isEditEnabled = true,
    this.isDeleteEnabled = true,
    this.isShareEnabled = true,
    this.isDownloadEnabled = true,
    this.isDownloadPDFEnabled = true,
    this.isDownloadCSVEnabled = true,
  }) : super(key: key);

  // **************************************************
  // DEFAULT FUNCTIONS
  // **************************************************
  // Default implementations for the callbacks

  static void _defaultPreviousPage() {
    print("Previous page (default)");
  }

  static void _defaultNextPage() {
    print("Next page (default)");
  }

  @override
  _CrudComponentState createState() => _CrudComponentState();
}

class _CrudComponentState extends State<CrudComponent> {
  final TextEditingController _searchController = TextEditingController();

  // **************************************************
  // INIT WIDGET
  // **************************************************

  @override
  void initState() {
    super.initState();

    // Listen for changes in the TextField input
    _searchController.addListener(() {
      print("Current text: ${_searchController.text}");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // **************************************************
  // HANDLERS
  // **************************************************

  _handleSearch(BuildContext context) {
    if (_searchController.text.isEmpty) {
      _showInfoMessageDialog(context);
    }
    widget.onSearch(_searchController.text);
  }

  _handleFilterSearch(BuildContext context) {
    if (widget.isSearchKeywordRequiredToFilterSearch &&
        _searchController.text.isEmpty) {
      _showInfoMessageDialog(context);
    } else {
      _showFiltersDialog(context);
    }
  }

  _handleOrderBy(BuildContext context) {
    if (widget.isSearchKeywordRequiredToOrderSearchResults &&
        _searchController.text.isEmpty) {
      _showInfoMessageDialog(context);
    } else {
      _showOrderByDialog(context);
    }
  }

  _handleCreate(BuildContext context) {
    _showCreateDialog(context);
  }

  // **************************************************
  // WIDGET BUILD
  // **************************************************

  @override
  Widget build(BuildContext context) {
    // If processing, show the non-dismissible dialog
    if (widget.isProcessing) {
      return _showProcessingDialog(context);
    }

    // Main content of the widget
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------------
          // TITLE AND CREATE BUTTON
          // --------------------------------------------------
          Row(
            children: [
              TitleText(title: widget.title),
              const SizedBox(width: 8),
              CreateButton(onPressed: () => _handleCreate(context)),
            ],
          ),
          // --------------------------------------------------
          // SEARCH INPUT AND SEARCH FILTER ORDER BUTTONS
          // --------------------------------------------------
          const SizedBox(height: 16),
          if (widget.data.isNotEmpty &&
              widget.data != null &&
              ResponsiveCRUDComponent.isMobile(context) == true)
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    controller: _searchController,
                    onSubmitted: (value) => _handleSearch(context),
                  ),
                ),
                const SizedBox(width: 8),
                SearchButton(
                  onPressed: () => _handleSearch(context),
                ),
              ],
            ),
          if (widget.data.isNotEmpty &&
              widget.data != null &&
              ResponsiveCRUDComponent.isMobile(context) == true)
            const SizedBox(height: 16),
          if (widget.data.isNotEmpty &&
              widget.data != null &&
              ResponsiveCRUDComponent.isMobile(context) == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SearchFiltersButton(
                  onPressed: () => _handleFilterSearch(context),
                ),
                const SizedBox(width: 8),
                OrderByButton(
                  onPressed: () => _handleOrderBy(context),
                ),
              ],
            ),
          if (widget.data.isNotEmpty &&
              widget.data != null &&
              ResponsiveCRUDComponent.isMobile(context) == false)
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    controller: _searchController,
                    onSubmitted: (value) => _handleSearch(context),
                  ),
                ),
                const SizedBox(width: 8),
                SearchButton(
                  onPressed: () => _handleSearch(context),
                ),
                const SizedBox(width: 8),
                SearchFiltersButton(
                  onPressed: () => _handleFilterSearch(context),
                ),
                const SizedBox(width: 8),
                OrderByButton(
                  onPressed: () => _handleOrderBy(context),
                ),
              ],
            ),
          // --------------------------------------------------
          // DATA TABLE
          // --------------------------------------------------
          const SizedBox(height: 16),
          if (widget.data.isEmpty || widget.data == null)
            const Expanded(
              child: Center(
                child: Text('No Data :('),
              ),
            ),
          if (widget.data.isNotEmpty && widget.data != null)
            // --------------------------------------------------
            // CODE BELOW IS TESTING
            // --------------------------------------------------
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: ConstrainedBox(
            //     constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
            //     child: DataTableComponent(
            //       data: widget.data,
            //       columnsDisplayText: widget.columnsDisplayText,
            //       visibleColumns: widget.visibleColumns,
            //       columnTextStyle: const TextStyle(
            //         color: Colors.green,
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       columnSpacing: 1,
            //       minWidth: 10,
            //     ),
            //   ),
            // ),
            // -------------
            // Scaffold(
            //   body: InteractiveViewer(
            //     panEnabled: true, // Enables scrolling in all directions
            //     boundaryMargin:
            //         EdgeInsets.all(20), // Adds some extra space around
            //     minScale: 0.5, // Minimum scale (optional for zooming)
            //     maxScale: 2.0, // Maximum scale (optional for zooming)
            //     child: Expanded(
            //       child: Container(
            //         child: DataTableComponent(
            //           data: widget.data,
            //           columnsDisplayText: widget.columnsDisplayText,
            //           visibleColumns: widget.visibleColumns,
            //           columnTextStyle: const TextStyle(
            //             color: Colors.green,
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold,
            //           ),
            //           columnSpacing: 1,
            //           minWidth: 10,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // -------------
            // InteractiveViewer(
            //   panEnabled: true, // Enables scrolling in all directions
            //   boundaryMargin:
            //       EdgeInsets.all(20), // Adds some extra space around
            //   minScale: 0.5, // Minimum scale (optional for zooming)
            //   maxScale: 2.0, // Maximum scale (optional for zooming)
            //   child: DataTableComponent(
            //     data: widget.data,
            //     columnsDisplayText: widget.columnsDisplayText,
            //     visibleColumns: widget.visibleColumns,
            //     columnTextStyle: const TextStyle(
            //       color: Colors.green,
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     columnSpacing: 1,
            //     minWidth: 10,
            //   ),
            // ),
            // --------------------------------------------------
            // CODE COMENTED BELOW IS WORKIGN
            // --------------------------------------------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                ),
                child: DataTableComponent(
                  data: widget.data,
                  columnsDisplayText: widget.columnsDisplayText,
                  visibleColumns: widget.visibleColumns,
                  //
                  columnTextStyle: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  columnSpacing: 1,
                  minWidth: 10,
                  //
                  isPreviewEnabled: widget.isPreviewEnabled,
                  isEditEnabled: widget.isEditEnabled,
                  isDeleteEnabled: widget.isDeleteEnabled,
                  isShareEnabled: widget.isShareEnabled,
                  isDownloadEnabled: widget.isDownloadEnabled,
                  isDownloadPDFEnabled: widget.isDownloadPDFEnabled,
                  isDownloadCSVEnabled: widget.isDownloadCSVEnabled,
                  //
                  onPreview: (data) {
                    debugPrint('$data');
                    _showReadDialog(context, data);
                  },
                  onEdit: (data) {
                    debugPrint('$data');
                    _showUpdateDialog(context, data);
                  },
                  onDelete: (data) {
                    debugPrint('$data');
                    _showDeleteDialog(context, data);
                  },
                  onShare: (data) {
                    if (widget.onShare != null) {
                      widget.onShare!(data);
                      return;
                    }
                    debugPrint('$data');
                  },
                  onDownload: (data) {
                    if (widget.onDownload != null) {
                      widget.onDownload!(data);
                      return;
                    }
                    debugPrint('$data');
                  },
                  onDownloadPDF: (data) {
                    if (widget.onDownloadPDF != null) {
                      widget.onDownloadPDF!(data);
                      return;
                    }
                    debugPrint('$data');
                  },
                  onDownloadCSV: (data) {
                    if (widget.onDownloadCSV != null) {
                      widget.onDownloadCSV!(data);
                      return;
                    }
                    debugPrint('$data');
                  },
                ),
                // ------------------------------
                // ------------------------------
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: ConstrainedBox(
                //     constraints: BoxConstraints(minWidth: 10),
                //     child: DataTableComponent(
                //       data: widget.data,
                //       columnsDisplayText: widget.columnsDisplayText,
                //       visibleColumns: widget.visibleColumns,
                //       columnTextStyle: const TextStyle(
                //         color: Colors.green,
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       columnSpacing: 1,
                //       minWidth: 10,
                //     ),
                //   ),
                // ),
                // ------------------------------
              ),
            ),
          // --------------------------------------------------
          // PAGiNATION BUTTONS
          // --------------------------------------------------
          const SizedBox(height: 16),
          if (widget.data.isNotEmpty && widget.data != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaginationButton(
                  text: 'Previous',
                  // onPressed: () => _handlePreviousPage(),
                  onPressed: widget.onPreviousPage,
                  isDisabled: false, // or true to disable
                ),
                PaginationButton(
                  text: 'Next',
                  // onPressed: () => _handlePreviousPage(),
                  onPressed: widget.onNextPage,
                  isDisabled: false, // or true to disable
                ),
              ],
            ),
          // --------------------------------------------------
        ],
      ),
    );
  }

  // **************************************************
  // ALERT WIDGETS
  // **************************************************

  Widget _showProcessingDialog(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.green, // Set the color
        strokeWidth: 6.0, // Adjust thickness
      ),
    );
  }

  void _showInfoMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertInfo(
          infoText: 'Please enter some text to search',
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogFullscreen(
          titleText: widget.alertCreateTitle,
          titleTextWidget: widget.alertCreateTitleTextWidget,
          contentWidget: widget.createFormWidget != null
              ? SingleChildScrollView(
                  child: widget.createFormWidget!(),
                )
              : const Center(
                  child: Text('NO widget.createFormWidget'),
                ),
        );
      },
      barrierDismissible: false, // Prevent dismiss by tapping outside
    );
  }

  void _showReadDialog(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogFullscreen(
          titleText: widget.alertReadTitle,
          titleTextWidget: widget.alertReadTitleTextWidget,
          contentWidget: widget.readContentWidget != null
              ? SingleChildScrollView(
                  child: widget.readContentWidget!(data),
                )
              : const Center(
                  child: Text('NO widget.readContentWidget'),
                ),
        );
      },
      barrierDismissible: false, // Prevent dismiss by tapping outside
    );
  }

  void _showFiltersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertContent(
          titleText: widget.alertFilterTitle,
          titleTextWidget: widget.alertFilterTitleTextWidget,
          contentWidget: widget.filterFormWidget ??
              const Text('NO widget.filterFormWidget'),
        );
      },
    );
  }

  void _showOrderByDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertContent(
          titleText: widget.alertOrderByTitle,
          titleTextWidget: widget.alertOrderByTitleTextWidget,
          contentWidget: widget.orderByFormWidget ??
              const Text('NO widget.orderByFormWidget'),
        );
      },
    );
  }

  void _showUpdateDialog(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogFullscreen(
          titleText: widget.alertUpdateTitle,
          titleTextWidget: widget.alertUpdateTitleTextWidget,
          // contentWidget: widget.updateFormWidget!(data) ??
          //     const Center(
          //       child: Text('NO widget.updateFormWidget'),
          //     ),
          contentWidget: widget.updateFormWidget != null
              ? SingleChildScrollView(
                  child: widget.updateFormWidget!(data),
                )
              : const Center(
                  child: Text('NO widget.updateFormWidget'),
                ),
        );
      },
      barrierDismissible: false, // Prevent dismiss by tapping outside
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertConfirm(
          titleText: widget.alertDeleteTitle,
          messageText: widget.alertDeleteMessage,
          titleTextWidget: widget.alertDeleteTitleTextWidget,
          messageTextWidget: widget.alertDeleteMessageTextWidget,
          onConfirm:
              data != null && data['id'] != null && widget.onDelete != null
                  ? () => widget.onDelete!(data['id'].toString())
                  : () => print('Do not do this at home!'),
        );
      },
    );
  }
}

// **************************************************
// RESPONSIVE CLASS HELPER
// **************************************************

class ResponsiveCRUDComponent {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}


import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/models/donation_model.dart';
import 'package:get/get.dart';
import '../../../../controllers/donation_controller.dart';


class DonationTable extends StatefulWidget {
  const DonationTable({Key? key}) : super(key: key);

  @override
  State<DonationTable> createState() => _DonationTableState();
}

class _DonationTableState extends State<DonationTable> {

  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final _source = DonationTableSource();
  var _sortIndex = 0;
  var _sortAsc = true;
  final _searchController = TextEditingController();
  final DonationController _donationController = Get.put(DonationController());
  List<DonationModel> donationModel = [];



  @override
  void initState() {
    super.initState();
    _searchController.text = '';
    getData();
  }

  getData() async{
    donationModel = (await _donationController.getDonationsData())!;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search by Name',
                      ),
                      onSubmitted: (value) {
                        _source.filterServerSide(_searchController.text);
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _searchController.text = '';
                    });
                    _source.filterServerSide(_searchController.text);
                  },
                  icon: const Icon(Icons.clear),
                ),
                IconButton(
                  onPressed: () =>
                      _source.filterServerSide(_searchController.text),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            AdvancedPaginatedDataTable(
              addEmptyRows: false,
              source: _source,
              sortAscending: _sortAsc,
              sortColumnIndex: _sortIndex,
              showFirstLastButtons: true,
              rowsPerPage: _rowsPerPage,
              availableRowsPerPage: const [10, 20, 30, 50],
              onRowsPerPageChanged: (newRowsPerPage) {
                if (newRowsPerPage != null) {
                  setState(() {
                    _rowsPerPage = newRowsPerPage;
                  });
                }
              },
              columns: [
                DataColumn(
                  label: const Text('Name'),
                  onSort: setSort,
                ),
                DataColumn(
                  label: const Text('Project'),
                  onSort: setSort,
                ),
                DataColumn(
                  label: const Text('City'),
                  onSort: setSort,
                ),
                const DataColumn(
                  label: Text('Amount'),
                ),
                const DataColumn(
                  label: Text('transactionID'),
                ),
              ],

              getFooterRowText: (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
                final localizations = MaterialLocalizations.of(context);
                var amountText = localizations.pageRowsInfoTitle(
                  startRow,
                  pageSize,
                  totalFilter ?? totalRowsWithoutFilter,
                  false,
                );
                if (totalFilter != null) {
                  amountText += ' filtered from ($totalRowsWithoutFilter)';
                }
                return amountText;
              },
              customTableFooter: (source, offset) {
                const maxPagesToShow = 6;
                const maxPagesBeforeCurrent = 3;
                final lastRequestDetails = source.lastDetails!;
                final rowsForPager = lastRequestDetails.filteredRows ?? lastRequestDetails.totalRows;
                final totalPages = rowsForPager ~/ _rowsPerPage;
                final currentPage = (offset ~/ _rowsPerPage) + 1;
                List<int> pageList = [];
                if (currentPage > 1) {
                  pageList.addAll(
                    List.generate(currentPage - 1, (index) => index + 1),
                  );
                  //Keep up to 3 pages before current in the list
                  pageList.removeWhere((element) => element < currentPage - maxPagesBeforeCurrent,);
                }
                pageList.add(currentPage);
                pageList.addAll(List.generate(maxPagesToShow - (pageList.length - 1), (index) => (currentPage + 1) + index));
                pageList.removeWhere((element) => element > totalPages);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: pageList.map((e) => TextButton(
                    onPressed: e != currentPage ? () {
                      source.setNextView(startIndex: (e - 1) * _rowsPerPage);
                    } : null,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                  ).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  void setSort(int i, bool asc) => setState(() {_sortIndex = i; _sortAsc = asc;});
}

typedef SelectedCallBack = Function(String id, bool newSelectState);

class DonationTableSource extends AdvancedDataTableSource<DonationModel> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';
  final DonationController _donationController = Get.put(DonationController());
  List<DonationModel> donationModel = [];

  @override
  DataRow? getRow(int index) => lastDetails!.rows[index].getRow(selectedRow, selectedIds);

  @override
  int get selectedRowCount => selectedIds.length;

  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<DonationModel>> getNextPage(NextPageRequest pageRequest) async {
    final queryParameter = <String, dynamic>{
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      'sortIndex': ((pageRequest.columnSortIndex ?? 0) + 1).toString(),
      'sortAsc': ((pageRequest.sortAscending ?? true) ? 1 : 0).toString(),
      if (lastSearchTerm.isNotEmpty) 'nameFilter': lastSearchTerm,
    };

    if (donationModel.isNotEmpty) {
      donationModel = (await _donationController.getDonationsData())!;
      print("**************************  "+donationModel.length.toString());
      return RemoteDataSourceDetails(donationModel.length, (donationModel),
            filteredRows: lastSearchTerm.isNotEmpty ? donationModel.length : null,
      );
    } else {
      throw Exception('Unable to query remote server');
    }
  }
}

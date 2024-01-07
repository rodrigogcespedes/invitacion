import 'package:financeiro/core/generics/generic_filter.dart';
import 'package:financeiro/core/widgets/entity_pages/button_add_widget.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/generics/generic_crud_widget.dart';
import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:financeiro/core/widgets/entity_pages/pages_slider_widget.dart';
import 'package:financeiro/core/generics/base_entity.dart';
import 'package:financeiro/core/generics/generic_dts.dart';
import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListViewCustom extends StatefulWidget {
  final int rowsPerPage;
  final GenericDTS dts;
  final String collectionName;
  final String? collectionTitle;
  final BaseEntity Function(Map<String, dynamic> dynamicsList)? toListFunction;
  final bool primary;
  final int? totalElements;
  final GenericCrud? crud;
  final FlutterFlowModel? model;
  final GenericFilter? filterWrap;
  final bool? onlyActiveEntities;
  final bool? entityList;

  const ListViewCustom({
    super.key,
    required this.rowsPerPage,
    required this.dts,
    required this.collectionName,
    this.toListFunction,
    required this.primary,
    this.totalElements,
    this.crud,
    this.model,
    this.filterWrap,
    this.entityList,
    this.onlyActiveEntities,
    this.collectionTitle,
  });

  @override
  State<ListViewCustom> createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<ListViewCustom> {
  int currentPage = 1;
  List<String> filters = [];
  bool displayFilter = false;
  bool displayFilterContainer = false;
  List<BaseEntity> receivedItemsList = [];
  late final TextEditingController textFilterController;

  @override
  void initState() {
    textFilterController = TextEditingController();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (widget.primary && (widget.entityList ?? true)) {
          context.read<GenericItemsProvider>().loadListView(
              generic: widget.collectionName,
              amountItems: widget.rowsPerPage,
              page: currentPage,
              toListFunction: widget.toListFunction!,
              basicFilter: textFilterController.text,
              filters: filters.join(),
              onlyActiveEntities: widget.onlyActiveEntities);
        }
      }
    });
  }

  @override
  void dispose() {
    textFilterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final genericItemsProvider = context.watch<GenericItemsProvider>();
    final navigationProvider = context.watch<NavigationProvider>();
    final selectedMenuItem = navigationProvider.selectedMenuItem;
    final lastPage = ((widget.primary
                ? genericItemsProvider.itemsCount
                : widget.totalElements!) /
            widget.rowsPerPage)
        .ceil()
        .toInt();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.entityList ?? true)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (selectedMenuItem?.listTitle != null)
                            Text(
                              selectedMenuItem?.listTitle ?? '',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 4, 12, 0),
                            child: Text(
                              'Lista com ${widget.collectionTitle}',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              desktop: true,
                            ) &&
                            widget.primary)
                          SizedBox(
                            width: 240,
                            child: TextFormField(
                              controller: textFilterController,
                              onChanged: (value) {
                                displayFilter = value.isEmpty ? false : true;
                                setState(() {});
                              },
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: selectedMenuItem?.searchHint,
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                prefixIcon: !displayFilter
                                    ? Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        size: 20,
                                      )
                                    : null,
                                suffixIcon: displayFilter
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(4, 0, 2, 0),
                                            child: InkWell(
                                              onTap: () {
                                                if (widget.primary) {
                                                  genericItemsProvider.loadListView(
                                                      generic:
                                                          widget.collectionName,
                                                      basicFilter:
                                                          textFilterController
                                                              .text,
                                                      toListFunction:
                                                          widget.toListFunction,
                                                      filters: filters.join(),
                                                      onlyActiveEntities: widget
                                                          .onlyActiveEntities);
                                                } else {
                                                  genericItemsProvider
                                                      .refresh();
                                                }
                                              },
                                              child: Icon(
                                                Icons.search_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(2, 0, 8, 0),
                                            child: InkWell(
                                              onTap: () {
                                                if (widget.primary) {
                                                  genericItemsProvider.loadListView(
                                                      generic:
                                                          widget.collectionName,
                                                      basicFilter: '',
                                                      toListFunction:
                                                          widget.toListFunction,
                                                      filters: '',
                                                      onlyActiveEntities: widget
                                                          .onlyActiveEntities);
                                                } else {
                                                  genericItemsProvider
                                                      .refresh();
                                                }
                                                textFilterController.clear();
                                                filters.clear();
                                                displayFilter = false;
                                                displayFilterContainer = false;
                                              },
                                              child: Icon(
                                                Icons.cancel,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                        if (widget.filterWrap != null)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 0, 0),
                            child: InkWell(
                              onTap: () {
                                displayFilterContainer =
                                    !displayFilterContainer;
                                if (!displayFilterContainer) {
                                  if (widget.primary) {
                                    genericItemsProvider.loadListView(
                                        generic: widget.collectionName,
                                        basicFilter: textFilterController.text,
                                        toListFunction: widget.toListFunction,
                                        filters: '',
                                        onlyActiveEntities:
                                            widget.onlyActiveEntities);
                                  } else {
                                    genericItemsProvider.refresh();
                                  }
                                }
                                filters.clear();
                                setState(() {});
                              },
                              focusColor: FlutterFlowTheme.of(context).primary,
                              hoverColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(8),
                              child: Icon(
                                displayFilterContainer
                                    ? Icons.filter_list_off_outlined
                                    : Icons.filter_list_outlined,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 32,
                              ),
                            ),
                          ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                          child: ButtonAddWidget(
                            selectedMenuItem: selectedMenuItem,
                            primary: widget.primary,
                            crud: widget.crud,
                            model: widget.model,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (displayFilterContainer)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: widget.filterWrap!.setAtributtes(
                            basicFilter: textFilterController.text,
                            filters: filters),
                      )),
                )
            ],
          ),
        ),
        ((widget.entityList ??
                    (genericItemsProvider.isLoading ||
                        (widget.dts.getColumnTitles() !=
                                widget.dts.columnTitles &&
                            widget.primary))) ||
                navigationProvider.authProvider.user == null)
            ? const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 12),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: (selectedMenuItem?.collection ?? '').isEmpty
                        ? const Center(
                            child: Text('Nenhum campo selecionado'),
                          )
                        : ListView(
                            shrinkWrap: true,
                            children: [
                              DataTable(
                                showCheckboxColumn: false,
                                columns: GenericDTS.getDataColumns(
                                    context, widget.dts.getColumnTitles()),
                                rows: widget.primary
                                    ? widget.dts.getDataRows()
                                    : widget.dts.getDataRows().sublist(
                                        widget.rowsPerPage * (currentPage - 1),
                                        (widget.rowsPerPage * (currentPage) <
                                                widget.dts.rowCount)
                                            ? widget.rowsPerPage * (currentPage)
                                            : (widget.dts.rowCount)),
                              )
                            ],
                          ),
                  ),
                  if ((widget.entityList ?? true) &&
                      widget.dts.getColumnTitles().length > 1)
                    PagesWidgetSlider(
                      rowsPerPage: widget.rowsPerPage,
                      collectionName: widget.collectionName,
                      currentPage: currentPage,
                      textFilterController: textFilterController,
                      nextPage: () async {
                        if (currentPage != lastPage) {
                          currentPage++;
                          if (widget.primary) {
                            await genericItemsProvider.getGenericItems(
                                generic: widget.collectionName,
                                amountItems: widget.rowsPerPage,
                                page: currentPage,
                                toListFunction: widget.toListFunction!,
                                basicFilter: textFilterController.text,
                                filters: filters.join());
                          }
                          genericItemsProvider.refresh();
                        }
                      },
                      previousPage: () async {
                        if (currentPage != 1) {
                          currentPage--;
                          if (widget.primary) {
                            await genericItemsProvider.getGenericItems(
                                generic: widget.collectionName,
                                amountItems: widget.rowsPerPage,
                                page: currentPage,
                                toListFunction: widget.toListFunction!,
                                basicFilter: textFilterController.text,
                                filters: filters.join());
                          }
                          genericItemsProvider.refresh();
                        }
                      },
                      totalItems: (widget.primary
                          ? genericItemsProvider.itemsCount
                          : widget.totalElements!),
                    ),
                ],
              ),
      ],
    );
  }
}

import 'package:financeiro/core/generics/base_tree_entity.dart';
import 'package:financeiro/core/generics/inverse_tree.dart';
import 'package:financeiro/core/widgets/entity_pages/acoes.dart';
import 'package:financeiro/core/widgets/entity_pages/button_add_widget.dart';
import 'package:financeiro/core/widgets/entity_pages/enums/lista_acoes_tree_entry.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/generics/generic_crud_widget.dart';
import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:financeiro/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TreeViewCustom<T extends BaseTreeEntity> extends StatefulWidget {
  final String collectionName;
  final String? collectionTitle;
  final BaseTreeEntity Function(Map<String, dynamic> dynamicsList)?
      toListFunction;
  final bool primary;
  final GenericCrud? crud;
  final FlutterFlowModel? model;
  final bool? onlyActiveEntities;
  final bool? entityList;
  final bool softDelete;

  const TreeViewCustom({
    super.key,
    required this.collectionName,
    this.toListFunction,
    required this.primary,
    this.crud,
    this.model,
    this.entityList,
    required this.softDelete,
    this.collectionTitle,
    this.onlyActiveEntities,
  });

  @override
  State<TreeViewCustom> createState() => _TreeViewCustomState<T>();
}

class _TreeViewCustomState<T extends BaseTreeEntity>
    extends State<TreeViewCustom> {
  List<String> filters = [];
  TreeController<InverseTree>? treeController;
  late final TextEditingController textFilterController;
  bool displayFilter = false;
  bool toExpandAll = true;

  @override
  void initState() {
    textFilterController = TextEditingController();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (widget.primary && (widget.entityList ?? true)) {
          context
              .read<GenericItemsProvider>()
              .loadTreeView<T>(
                  generic: widget.collectionName,
                  toListFunction: widget.toListFunction,
                  onlyActiveEntities: widget.onlyActiveEntities)
              .then((value) => treeController = TreeController<InverseTree>(
                    roots: context.read<GenericItemsProvider>().inverseTree!,
                    childrenProvider: (InverseTree node) => node.children!,
                  ));

          context.read<GenericItemsProvider>().refresh();
        }
      }
    });
  }

  @override
  void dispose() {
    textFilterController.dispose();
    treeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final genericItemsProvider = context.watch<GenericItemsProvider>();
    final navigationProvider = context.watch<NavigationProvider>();

    return Column(
      children: [
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
            child: /* if (widget.entityList ?? true) */
                Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 4, 12, 0),
                        child: Text(
                          'Árvore de ${widget.collectionTitle}',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
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
                            hintText:
                                navigationProvider.selectedMenuItem?.searchHint,
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
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
                                    color: FlutterFlowTheme.of(context).accent2,
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
                                            for (InverseTree root
                                                in genericItemsProvider
                                                        .inverseTree ??
                                                    []) {
                                              root.cascadeShiny(false);
                                            }

                                            for (InverseTree root
                                                in genericItemsProvider
                                                        .inverseTree ??
                                                    []) {
                                              root.lookForShiny(
                                                  textFilterController.text);
                                            }
                                            genericItemsProvider.refresh();
                                          },
                                          child: Icon(
                                            Icons.search_rounded,
                                            color: FlutterFlowTheme.of(context)
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
                                            for (InverseTree root
                                                in genericItemsProvider
                                                        .inverseTree ??
                                                    []) {
                                              root.cascadeShiny(false);
                                              root.cascadeSelected(false);
                                            }
                                            textFilterController.clear();
                                            displayFilter = false;
                                            genericItemsProvider.refresh();
                                          },
                                          child: Icon(
                                            Icons.cancel,
                                            color: FlutterFlowTheme.of(context)
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: InkWell(
                        onTap: () {
                          if (toExpandAll) {
                            treeController!.expandCascading(
                                genericItemsProvider.inverseTree ?? []);
                          } else {
                            treeController!.collapseCascading(
                                genericItemsProvider.inverseTree ?? []);
                          }
                          toExpandAll = !toExpandAll;
                        },
                        focusColor: FlutterFlowTheme.of(context).primary,
                        hoverColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8),
                        child: Icon(
                          Icons.account_tree_rounded,
                          color: FlutterFlowTheme.of(context).accent2,
                          size: 32,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: ButtonAddWidget(
                        selectedMenuItem: navigationProvider.selectedMenuItem,
                        primary: widget.primary,
                        crud: widget.crud,
                        model: widget.model,
                      ),
                    ),
                  ],
                ),
              ],
            )),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: (treeController != null)
              ? TreeView(
                  treeController: treeController!,
                  nodeBuilder:
                      (BuildContext context, TreeEntry<InverseTree> entry) {
                    return TreeIndentation(
                      entry: entry,
                      child: Row(
                        children: [
                          if (entry.hasChildren)
                            ExpandIcon(
                              key: GlobalObjectKey(entry.node),
                              isExpanded: entry.isExpanded,
                              onPressed: (_) {
                                return (treeController != null)
                                    ? treeController!
                                        .toggleExpansion(entry.node)
                                    : null;
                              },
                            ),
                          Flexible(
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: entry.node.shiny
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: entry.node.shiny
                                                  ? FontWeight.bold
                                                  : FontWeight.w600),
                                      text:
                                          ' ${(entry.node.node as T).getTreeEntryText()}'),
                                ),
                                PopupMenuButton(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  iconSize: 10,
                                  itemBuilder: (context) => acoes.map(
                                    (e) {
                                      return PopupMenuItem<Acao>(
                                        onTap: () async {
                                          switch (e.label) {
                                            case 'Editar':
                                              genericItemsProvider.navigateTo(
                                                  context,
                                                  (entry.node.node as T).id!);
                                              break;
                                            case 'Criar nova filial':
                                              genericItemsProvider.setPreset(
                                                  entry.node.node
                                                      .getChildPreset());
                                              context.go(navigationProvider
                                                  .selectedMenuItem!
                                                  .toPathBottonNew!);
                                              break;
                                            case 'Excluir':
                                              await genericItemsProvider
                                                  .deleteItem<T>(
                                                generic: widget.collectionName,
                                                id: (entry.node.node as T).id!,
                                                context: context,
                                                primary: true,
                                                softDelete: widget.softDelete,
                                                fromTreeView: true,
                                              );
                                              treeController!.rebuild();
                                              break;
                                            default:
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            e.icon,
                                            const SizedBox(width: 10),
                                            Text(e.label,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall),
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    );
  }
}

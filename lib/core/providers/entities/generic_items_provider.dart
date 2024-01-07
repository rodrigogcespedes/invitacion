import 'package:financeiro/core/api/directus_api.dart';
import 'package:financeiro/core/generics/base_tree_entity.dart';
import 'package:financeiro/core/generics/inverse_tree.dart';
import 'package:financeiro/core/http/generic_item_response.dart';
import 'package:financeiro/core/http/generic_items_response.dart';
import 'package:financeiro/core/http/dropdown_response.dart';
import 'package:financeiro/core/providers/navigation/navigation_provider.dart';
import 'package:financeiro/core/services/snack_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:financeiro/core/generics/base_entity.dart';

import '../../http/count_response.dart';

class GenericItemsProvider extends ChangeNotifier {
  final NavigationProvider navigationProvider;
  GenericItemsProvider({required this.navigationProvider});

  bool isLoading = false;
  int itemsCount = 0;
  late BaseEntity Function(Map<String, dynamic> dynamicsList) lastDynamicsList;

  List<BaseEntity> entities = [];
  BaseEntity? entity;

  List<InverseTree>? inverseTree = [];
  BaseEntity? preset;

  void refresh() {
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    notifyListeners();
  }

  void setMenuItem(String collection) {
    for (final categorie in NavigationProvider.categories) {
      for (final menuItem in categorie.menuItems ?? []) {
        if (menuItem.collection == collection) {
          navigationProvider.setMenuItem(menuItem);
          break;
        }
      }
    }
  }

  void setPreset(BaseEntity? preset) {
    this.preset = preset;
  }

  Future<void> loadListView({
    required String generic,
    int? amountItems,
    int? page,
    BaseEntity Function(Map<String, dynamic> dynamicsList)? toListFunction,
    String? basicFilter,
    String? filters,
    bool? onlyActiveEntities,
  }) async {
    if (navigationProvider.authProvider.user == null) return;

    amountItems ??= 10;
    page ??= 1;
    basicFilter ??= '';
    toListFunction ??= lastDynamicsList;
    try {
      setIsLoading(true);
      await getGenericItems(
        generic: generic,
        amountItems: amountItems,
        page: page,
        toListFunction: toListFunction,
        basicFilter: basicFilter,
        filters: filters,
        ignoreSetLoading: true,
        onlyActiveEntities: onlyActiveEntities,
      );

      await getFilterCount(
        generic: generic,
        basicFilter: basicFilter,
        filters: filters,
        ignoreSetLoading: true,
        onlyActiveEntities: onlyActiveEntities,
      );
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> loadTreeView<T extends BaseTreeEntity>({
    required String generic,
    int? amountItems,
    int? page,
    BaseEntity Function(Map<String, dynamic> dynamicsList)? toListFunction,
    String? basicFilter,
    String? filters,
    bool? onlyActiveEntities,
  }) async {
    if (navigationProvider.authProvider.user == null) return;

    amountItems ??= -1;
    page ??= 1;
    basicFilter ??= '';
    toListFunction ??= lastDynamicsList;
    onlyActiveEntities ??= true;
    try {
      setIsLoading(true);
      await getGenericItems(
        generic: generic,
        amountItems: -1,
        page: page,
        toListFunction: toListFunction,
        basicFilter: basicFilter,
        ignoreSetLoading: true,
        onlyActiveEntities: onlyActiveEntities,
      );

      List<T> castedEntities = entities.map((x) => x as T).toList();

      inverseTree =
          InverseTree.revertAnyToOneRelation<T>(entities: castedEntities);
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> getGenericItems({
    required String generic,
    required int amountItems,
    required int page,
    required BaseEntity Function(Map<String, dynamic> dynamicsList)
        toListFunction,
    required String basicFilter,
    String? filters,
    bool? ignoreSetLoading,
    bool? onlyActiveEntities,
  }) async {
    if (navigationProvider.selectedMenuItem == null) return;
    if (navigationProvider.selectedMenuItem!.collection == null) return;
    try {
      ignoreSetLoading ??= true;
      onlyActiveEntities ??= false;
      if (!ignoreSetLoading) setIsLoading(true);
      lastDynamicsList = toListFunction;
      final resp = await DirectusAPI.httpGet(
          //'items/${navigationProvider.selectedMenuItem?.collection}?fields=${navigationProvider.selectedMenuItem?.fields?.join(',')}$filters&search=$basicFilter&limit=${amountItems.toString()}&page=${page.toString()}');
          'items/${navigationProvider.selectedMenuItem?.collection}?fields=${navigationProvider.selectedMenuItem?.fields?.join(',')}$filters${onlyActiveEntities ? '&filter[state][_eq]=true' : ''}&search=$basicFilter&limit=${amountItems.toString()}&page=${page.toString()}');
      entities = GenericItemsResponse.fromMap2List(resp, toListFunction)!;
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    } finally {
      ignoreSetLoading ??= true;
      if (!ignoreSetLoading) setIsLoading(false);
    }
  }

  Future<void> getFilterCount({
    required String generic,
    required String basicFilter,
    String? filters,
    bool? ignoreSetLoading,
    bool? onlyActiveEntities,
  }) async {
    if (navigationProvider.selectedMenuItem == null) return;
    if (navigationProvider.selectedMenuItem!.collection == null) return;
    try {
      ignoreSetLoading ??= true;
      onlyActiveEntities ??= false;
      if (!ignoreSetLoading) setIsLoading(true);
      final resp = await DirectusAPI.httpGet(
          //'items/${navigationProvider.selectedMenuItem?.collection}?search=$basicFilter$filters&aggregate[count]=*');
          'items/${navigationProvider.selectedMenuItem?.collection}?search=$basicFilter$filters${onlyActiveEntities ? '&filter[state][_eq]=true' : ''}&aggregate[count]=*');
      final itemsCountResponse = CountResponse.fromMap(resp);
      itemsCount = int.parse(itemsCountResponse.data);
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    } finally {
      ignoreSetLoading ??= true;
      if (!ignoreSetLoading) setIsLoading(false);
    }
  }

  Future<dynamic> loadDropDown({
    required String generic,
    required String fieldToShow,
    String? filters,
  }) async {
    if (navigationProvider.selectedMenuItem == null) return;
    if (navigationProvider.selectedMenuItem!.collection == null) return;
    try {
      setIsLoading(true);
      final resp = await DirectusAPI.httpGet(
          'items/$generic?fields=id,$fieldToShow${filters ?? ''}&limit=-1');
      final dropDownResponse =
          DropDownResponse.fromMap(resp, fieldToShow);
      return dropDownResponse.data as List<DropdownMenuItem<String>>;
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    }
  }

  Future<dynamic> loadDropDownEntity(
      {required String generic,
      required String id,
      required List<String> fields,
      required BaseEntity Function(Map<String, dynamic> dynamicEntity)
          toEntityFunction}) async {
    if (navigationProvider.selectedMenuItem == null) return;
    if (navigationProvider.selectedMenuItem!.collection == null) return;
    try {
      final resp = await DirectusAPI.httpGet(
          'items/$generic/$id?fields=${fields.join(',')}');
      return GenericItemResponse.fromMap2Entity(resp, toEntityFunction);
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    }
  }

  Future<void> getGenericItem(
      String id,
      String generic,
      BaseEntity Function(Map<String, dynamic> dynamicEntity)
          toEntityFunction) async {
    //if (navigationProvider.authProvider.user == null) return;

    try {
      setMenuItem(generic);
      setIsLoading(true);
      if (id == 'new') {
        if (preset != null) {
          entity?.turnInto(preset!);
          preset = null;
        }
        return;
      }
      final resp = await DirectusAPI.httpGet(
          'items/$generic/$id?fields=${navigationProvider.selectedMenuItem?.fields?.join(',')}&m');
      entity = GenericItemResponse.fromMap2Entity(resp, toEntityFunction);
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao consultar $generic ${e.toString()}');
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> saveGenericItem(
      String generic,
      BuildContext context,
      BaseEntity Function(Map<String, dynamic> dynamicEntity)
          toEntityFunction) async {
    try {
      setMenuItem(generic);
      setIsLoading(true);
      bool isNewRecord = entity?.id == null;
      Map<String, dynamic>? data = entity?.toMap();
      final resp = isNewRecord
          ? await DirectusAPI.post(
              'items/$generic?fields=${navigationProvider.selectedMenuItem?.fields?.join(',')}',
              data!)
          : await DirectusAPI.patch(
              'items/$generic/${data?['id']}?fields=${navigationProvider.selectedMenuItem?.fields?.join(',')}',
              data!);
      entity = GenericItemResponse.fromMap2Entity(resp, toEntityFunction);
      if (context.mounted) {
        context.go(navigationProvider.selectedMenuItem!.page!);
      }
    } catch (e) {
      SnackService.showSnackbarError('Erro ao salvar $generic ${e.toString()}');
    } finally {
      setIsLoading(false);
    }
  }

  void navigateTo(BuildContext context, String id) {
    context.go(navigationProvider.selectedMenuItem!.toPathBottonEdit!
        .replaceAll(':id', id));
  }

  Future deleteItem<T extends BaseTreeEntity>({
    required String generic,
    required String id,
    required BuildContext context,
    required bool primary,
    List<BaseEntity>? items,
    bool? softDelete,
    bool? fromTreeView,
  }) async {
    /* Future.delayed(
      const Duration(seconds: 0),
      () async { */
    await SnackService.mensagemConfirmacao(
      context,
      'Confirma a exclusão do registro?',
      () async {
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        fromTreeView ??= false;

        try {
          if (primary) {
            if (softDelete ?? false) {
              await _softDeleteGenericItem<T>(
                  generic, id, context, fromTreeView!);
            } else {
              await _deleteGenericItem(generic, id, context, fromTreeView!);
            }
          } else {
            items!.removeWhere((element) => element.id == id);
            notifyListeners();
          }
          if (fromTreeView ?? false) {
            inverseTree!.removeWhere((e) => e.node.id == id);
          }
        } catch (e) {
          SnackService.showSnackbarError(
              'Erro ao excluir registro ${e.toString()}');
          rethrow;
        }
      },
    );
    /* },
    ); */
  }

  Future<void> _deleteGenericItem(
    String generic,
    String id,
    BuildContext context,
    bool fromTreeView,
  ) async {
    try {
      setMenuItem(generic);
      setIsLoading(true);
      await DirectusAPI.delete('items/$generic/$id');
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao excluir $generic ${e.toString()}');
    } finally {
      if (fromTreeView) loadListView(generic: generic);
      setIsLoading(false);
    }
  }

  Future<void> _softDeleteGenericItem<T extends BaseTreeEntity>(
    String generic,
    String id,
    BuildContext context,
    bool fromTreeView,
  ) async {
    try {
      setMenuItem(generic);
      setIsLoading(true);
      await DirectusAPI.patch('items/$generic/$id', {"state": false});
    } catch (e) {
      SnackService.showSnackbarError(
          'Erro ao excluir $generic ${e.toString()}');
    } finally {
      if (fromTreeView) loadListView(generic: generic);
      //loadTreeView<T>(generic: generic);
      setIsLoading(false);
    }
  }
}

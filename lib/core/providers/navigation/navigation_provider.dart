import 'package:financeiro/core/navigation/category_menu.dart';
import 'package:financeiro/core/navigation/menu_item.dart';
import 'package:financeiro/core/providers/auth/auth_provider.dart';
import 'package:financeiro/routes/route_utils.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  AuthProvider authProvider;

  NavigationProvider(this.authProvider) {
    // selectedMenuItem = categories.first.menuItems!.first;
  }

  static CategoryMenu? selectedCategoryMenu;
  MenuItem? selectedMenuItem;

  void setMenuItem(MenuItem menuItem) {
    selectedMenuItem = menuItem;
    //a = context.read<GenericItemsProvider>();
    notifyListeners();
  }

  void setSelectedCategory(CategoryMenu categoryMenu) {
    categoryMenu.selected = !(categoryMenu.selected ?? false);
    notifyListeners();
  }

  void setCategoryMenu(CategoryMenu categoryMenu) {
    selectedCategoryMenu = categoryMenu;
    notifyListeners();
  }

  DataCell dataCell(Widget child) {
    return DataCell(child);
  }

  static MenuItem getMenuItem(String collection) {
    MenuItem? menuItem;
    for (var category in categories) {
      for (var item in category.menuItems!) {
        if (item.collection == collection) {
          menuItem = item;
        }
      }
    }
    return menuItem!;
  }

  static final List<CategoryMenu> categories = [
    CategoryMenu().copyWith(
      name: 'MENU',
      icon: Icons.abc,
      route: '/home',
      visible: true,
      selected: true,
      menuItems: [
        /* MenuItem().copyWith(
          title: CostCenter().tittle,
          icon: Icons.business_outlined,
          visible: true,
          page: AppPage.costCenterPage.toPath,
          selected: true,
          listTitle: null,
          subTitle: 'Centro de custos cadastrados',
          searchHint: 'Pesquisar centro de custo...',
          collection: CostCenter().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.costCenterPage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.costCenterPage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: CostCenter().getFields(), // estes campos são para a queryParams
        ),
        MenuItem().copyWith(
          title: Employee().tittle,
          icon: Icons.people_alt_outlined,
          visible: true,
          page: AppPage.employeesPage.toPath,
          selected: true,
          listTitle: null,
          subTitle: 'Lista de funcionários cadastrados',
          searchHint: 'Pesquisar funcionário...',
          collection: Employee().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.employeesPage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.employeesPage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: Employee().getFields(), // estes campos são para a queryParams
        ),
        MenuItem().copyWith(
          title: Vacation().tittle,
          icon: Icons.beach_access_outlined,
          visible: true,
          page: AppPage.vacationPage.toPath,
          selected: false,
          listTitle: null,
          subTitle: 'Lista de férias cadastradas',
          searchHint: 'Pesquisar féria...',
          collection: Vacation().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.vacationPage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.vacationPage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: Vacation().getFields(), // estes campos são para a queryParams
        ),
        MenuItem().copyWith(
          title: ThirdParty().tittle,
          icon: Icons.contact_phone_outlined,
          visible: true,
          page: AppPage.thirdPartyPage.toPath,
          selected: false,
          listTitle: null,
          subTitle: 'Lista de terceiros cadastrados',
          searchHint: 'Pesquisar terceiro...',
          collection: ThirdParty().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.thirdPartyPage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.thirdPartyPage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: ThirdParty().getFields(), // estes campos são para a queryParams
        ),
        MenuItem().copyWith(
          title: BookValue().tittle,
          icon: Icons.collections_bookmark_outlined,
          visible: true,
          page: AppPage.bookValuePage.toPath,
          selected: false,
          listTitle: null,
          subTitle: 'Lista de contas contábiles cadastradas',
          searchHint: 'Pesquisar conta...',
          collection: BookValue().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.bookValuePage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.bookValuePage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: BookValue().getFields(), // estes campos são para a queryParams
        ),
        MenuItem().copyWith(
          title: CategoryOfTransaction().tittle,
          icon: Icons.collections_bookmark_outlined,
          visible: true,
          page: AppPage.categoryOfTransactionPage.toPath,
          selected: false,
          listTitle: null,
          subTitle: 'Lista de contas contábiles cadastradas',
          searchHint: 'Pesquisar conta...',
          collection: CategoryOfTransaction().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.categoryOfTransactionPage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.categoryOfTransactionPage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: CategoryOfTransaction().getFields(), // estes campos são para a queryParams
        ),
        MenuItem().copyWith(
          title: FinancialCategory().tittle,
          icon: Icons.collections_bookmark_outlined,
          visible: true,
          page: AppPage.financialCategoryPage.toPath,
          selected: false,
          listTitle: null,
          subTitle: 'Lista de categorias financeiras cadastradas',
          searchHint: 'Pesquisar categoria...',
          collection: FinancialCategory().tableName,
          initialFilters: [],
          toPathBottonNew:
              '${AppPage.financialCategoryPage.toPath}/${AppPage.genericCrudNew.toPath}',
          toPathBottonEdit:
              '${AppPage.financialCategoryPage.toPath}/${AppPage.genericCrudId.toPath}',
          fields: FinancialCategory().getFields(), // estes campos são para a queryParams
        ), */
      ],
    ),
    /* CategoryMenu().copyWith(
        name: 'FINANCEIRO',
        icon: Icons.abc,
        route: '/home',
        visible: true,
        selected: false,
        menuItems: [
          MenuItem().copyWith(
            title: 'Pagamentos diários',
            icon: Icons.payments_outlined,
            visible: true,
            page: AppPage.dailyPayments.toPath,
            selected: false,
            subTitle: 'Pagamentos diários',
            collection: 'dailyPayments',
          ),
        ]) */
  ];
}

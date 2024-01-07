enum AppPage {
  login,
  register,
  requestPassword,
  resetPassword,
  dailyPayments,
  homePage,
  costCenterPage,
  pageNotFound,
  vacationPage,
  employeesPage,
  thirdPartyPage,
  bookValuePage,
  categoryOfTransactionPage,
  financialCategoryPage,
  genericCrudId,
  genericCrudNew,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.login:
        return '/login';
      case AppPage.register:
        return '/register';
      case AppPage.homePage:
        return '/home';
      case AppPage.costCenterPage:
        return '/cost_centers';
      case AppPage.vacationPage:
        return '/vacation';
      case AppPage.employeesPage:
        return '/employees';
      case AppPage.requestPassword:
        return '/requestPassword';
      case AppPage.resetPassword:
        return '/resetPassword/:code';
      case AppPage.thirdPartyPage:
        return '/third_party';
      case AppPage.bookValuePage:
        return '/book_value';
      case AppPage.categoryOfTransactionPage:
        return '/category_of_transaction';
      case AppPage.financialCategoryPage:
        return '/financial_category';
      case AppPage.dailyPayments:
        return '/dailyPayments';
      case AppPage.genericCrudId:
        return ':id';
      case AppPage.genericCrudNew:
        return 'new';
      default:
        return '/page-not-found';
    }
  }

  String get toName {
    switch (this) {
      case AppPage.login:
        return 'LOGIN';
      case AppPage.register:
        return 'REGISTER';
      case AppPage.homePage:
        return 'HomePage';
      case AppPage.costCenterPage:
        return 'CostCenterPage';
      case AppPage.vacationPage:
        return 'VacationPage';
      case AppPage.employeesPage:
        return 'EmployeesPage';
      case AppPage.thirdPartyPage:
        return 'ThirdPartyPage';
      case AppPage.bookValuePage:
        return 'BookValuePage';
      case AppPage.categoryOfTransactionPage:
        return 'CategoryOfTransactionPage';
      case AppPage.financialCategoryPage:
        return 'FinancialCategoryPage';
      case AppPage.requestPassword:
        return 'RequestPassword';
      case AppPage.resetPassword:
        return 'ResetPassword';
      case AppPage.dailyPayments:
        return 'DailyPayments';
      case AppPage.genericCrudId:
        return 'ID';
      case AppPage.genericCrudNew:
        return 'New';
      default:
        return 'PageNotFound';
    }
  }
}

import 'package:financeiro/flutter_flow/flutter_flow_model.dart';
import 'package:financeiro/core/generics/generic_crud_widget.dart';
import 'package:flutter/material.dart';

class CrudStackProvider extends ChangeNotifier {
  List<GenericCrud> crudStack = [];
  List<FlutterFlowModel> modelStack = [];
  bool isGoingBack = false;
  bool isLoading = false;

  void setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void setIsGoingBack(bool isGoingBack) {
    this.isGoingBack = isGoingBack;
    notifyListeners();
  }

  void clearCrudStack() {
    setIsLoading(true);
    crudStack.clear();
    for (FlutterFlowModel model in modelStack) {
      model.dispose();
    }
    modelStack.clear();
  }

  void pushCrud(GenericCrud nextCrud, FlutterFlowModel nextModel) {
    setIsLoading(true);
    isGoingBack = false;
    crudStack.add(nextCrud);
    modelStack.add(nextModel);
    notifyListeners();
    setIsLoading(false);
  }

  void popCrud() {
    setIsLoading(true);
    isGoingBack = true;
    if (crudStack.length > 1) {
      crudStack.removeAt(crudStack.lastIndexOf(crudStack.last));
      modelStack.removeAt(modelStack.lastIndexOf(modelStack.last));
    }
    //setIsGoingBack(true);
    setIsLoading(false);
  }
}

import 'package:financeiro/flutter_flow/flutter_flow_model.dart';
import 'package:financeiro/flutter_flow/flutter_flow_theme.dart';
import 'package:financeiro/core/widgets/entity_pages/acoes.dart';
import 'package:financeiro/core/generics/base_entity.dart';
import 'package:financeiro/core/generics/generic_crud_widget.dart';
import 'package:financeiro/core/widgets/entity_pages/enums/lista_acoes_to_crud.dart';
import 'package:financeiro/core/providers/entities/generic_items_provider.dart';
import 'package:financeiro/core/providers/entities/crud_stack_provider.dart';
import 'package:flutter/material.dart';

DataCell acoesCrud({
  required String id,
  required String generic,
  required GenericItemsProvider genericItemsProvider,
  required CrudStackProvider crudStackProvider,
  required bool primary,
  required bool softDelete,
  required GenericCrud newCrud,
  required FlutterFlowModel newModel,
  required List<BaseEntity> items,
}) {
  return DataCell(
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          itemBuilder: (context) => acoes.map(
            (e) {
              return PopupMenuItem<Acao>(
                onTap: () async {
                  switch (e.label) {
                    case 'Editar':
                      if (primary) {
                        genericItemsProvider.navigateTo(context, id);
                      } else {
                        crudStackProvider.setIsLoading(true);
                        crudStackProvider.pushCrud(newCrud, newModel);
                        crudStackProvider.setIsLoading(false);
                        Scaffold.of(context).openEndDrawer();
                      }
                      break;
                    case 'Excluir':
                      genericItemsProvider.deleteItem(
                        generic: generic,
                        id: id,
                        context: context,
                        primary: primary,
                        items: items,
                        softDelete: softDelete,
                      );
                      break;
                    case 'Duplicar':
                      break;
                    default:
                  }
                },
                child: Row(
                  children: [
                    e.icon,
                    const SizedBox(width: 10),
                    Text(e.label,
                        style: FlutterFlowTheme.of(context).bodySmall),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ],
    ),
  );
}

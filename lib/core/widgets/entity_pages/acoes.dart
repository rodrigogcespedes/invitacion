import 'package:flutter/material.dart';

class Acao {
  const Acao({
    required this.label,
    required this.icon,
  });

  final String label;
  final Icon icon;

  static const Acao editar = Acao(
    label: 'Editar',
    icon: Icon(
      Icons.edit_outlined,
      size: 22,
    ),
  );

  static const Acao crearFilial = Acao(
    label: 'Criar nova filial',
    icon: Icon(
      Icons.create_new_folder_rounded,
      size: 22,
    ),
  );

  static const Acao excluir = Acao(
    label: 'Excluir',
    icon: Icon(
      Icons.delete_outline,
      size: 22,
      color: Colors.red,
    ),
  );

  static const Acao duplicar = Acao(
    label: 'Duplicar',
    icon: Icon(Icons.copy_outlined, size: 20),
  );

  @override
  String toString() => 'Acao(label: $label, icon: $icon)';
}

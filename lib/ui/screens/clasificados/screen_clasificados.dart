import 'package:flutter/material.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/ui/components/clasificados_components/clasificado_thumbnail_box.dart';
import 'package:homely_app/ui/components/clasificados_components/horizontal_categories_filter.dart';
import 'package:homely_app/ui/components/custom_app_bar.dart';
import 'package:homely_app/ui/components/search_text_field.dart';

class ClasificadosScreen extends StatelessWidget {
  const ClasificadosScreen({Key? key}) : super(key: key);

  static String get name => '/clasificados';

  @override
  Widget build(BuildContext context) {
    final List<Clasificado> clasificados = Clasificado.testingClasificados;
    final List<String> options = [
      'Apartamentos',
      'Servicios',
      'Productos',
      'Otros'
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Clasificados',
        subtitle: 'Ilarco 114 - 208 (TN)',
        hasBackButton: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SearchTextField(),
          HorizontalCategoryFilters(options: options, selectedIndex: 0),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 20.0),
              itemCount: clasificados.length,
              separatorBuilder: (_, index) => const SizedBox(height: 12),
              itemBuilder: (_, index) =>
                  ClasificadoThumbnailBox(clasificado: clasificados[index]),
            ),
          ),
        ],
      ),
    );
  }
}

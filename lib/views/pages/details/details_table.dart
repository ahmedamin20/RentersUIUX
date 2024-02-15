import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/keys_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../../../data/model/get_product_detiales_model/get_product_detiles_model.dart';

class DetailsTable extends StatelessWidget
{

   DetailsTable({super.key,required this.carModels});
  List<CarModels> carModels;
   List<PlutoRow> rows =
   [
//   PlutoRow(
//     cells: {
//       KeysManager.brand: PlutoCell(value: 'BMW'),
//       KeysManager.model: PlutoCell(value: 'X5'),
//       KeysManager.year: PlutoCell(value: 2020),
//     },
//   ),
// PlutoRow(
//     cells: {
//       KeysManager.brand: PlutoCell(value: 'BMW'),
//       KeysManager.model: PlutoCell(value: 'X6'),
//       KeysManager.year: PlutoCell(value: 2021),
//     },
//   ),
//  PlutoRow(
//     cells: {
//       KeysManager.brand: PlutoCell(value: 'BMW'),
//       KeysManager.model: PlutoCell(value: 'X7'),
//       KeysManager.year: PlutoCell(value: 2022),
//     },
//   ),
   ];
   List<PlutoRow> rowsTable()
   {
     carModels.map((e) {
       rows.add(PlutoRow(
         cells: {
           KeysManager.brand:   PlutoCell(value: e.name),
           KeysManager.model:   PlutoCell(value: e.carModelId),
           KeysManager.year:    PlutoCell(value: e.modelYear),
         },
       ));
     }).toList();
     return rows;
   }
   @override
  Widget build(BuildContext context)
   {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        child: PlutoGrid(
          mode: PlutoGridMode.readOnly,
          configuration:  PlutoGridConfiguration(
            style: PlutoGridStyleConfig(
              cellColorInReadOnlyState: Colors.cyan,
                iconColor: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.blackColor,
                menuBackgroundColor: LayoutCubit.get(context).isDark?ColorsManager.blackColor:ColorsManager.white,
                columnTextStyle: TextStyle(color:LayoutCubit.get(context).isDark? Colors.white:ColorsManager.blackColor),
            cellColorInEditState: Colors.cyan,
              gridBackgroundColor: LayoutCubit.get(context).isDark?ColorsManager.blackColor:ColorsManager.white,
              cellTextStyle:  TextStyle(color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.blackColor),
              rowColor:LayoutCubit.get(context).isDark? ColorsManager.blackColor:ColorsManager.white
            ),
            columnSize: const PlutoGridColumnSizeConfig(
              autoSizeMode: PlutoAutoSizeMode.equal,
              resizeMode: PlutoResizeMode.normal,

            ),
          ),
          columns: columns,
          rows: rowsTable(),
        ),
      ),
    );
  }
}

List<PlutoColumn> columns = [
  PlutoColumn(
    readOnly: true,
    enableEditingMode: false,
    enableSorting: false,
    enableFilterMenuItem: false,
    title: TextManager.brand.tr(),
    field: KeysManager.brand,
    type: PlutoColumnType.text(),
  ),
  PlutoColumn(
    readOnly: true,
    title: TextManager.model.tr(),
    field: KeysManager.model,
    type: PlutoColumnType.text(),
  ),
  PlutoColumn(
    readOnly: true,
    title: TextManager.year.tr(),
    field: KeysManager.year,
    type: PlutoColumnType.number(),
  ),
];



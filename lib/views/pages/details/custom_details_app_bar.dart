import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

class DetailsCustomAppBar extends StatelessWidget {
  const DetailsCustomAppBar({
    super.key,
    required this.name,
    required this.image
    ,required this.favourite,
    required this.function,

  });
  final String name;
  final List<String?>image;
  final bool favourite;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: LayoutCubit.get(context).isDark?ColorsManager.blackColor:ColorsManager.grayDark,
        pinned: true,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.gray,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        expandedHeight: MediaQuery.sizeOf(context).height * 0.40,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          title:  Text(name),
          centerTitle: true,
          background:  PageView.builder(
            itemCount: image.length,
            itemBuilder: (context, index) {
            return CachedNetworkImage(imageUrl:image[index]! ,);
          },),
        ),
        actions: const <Widget>[
          // IconButton(
          //     icon:  favourite ?
          //     const Icon(
          //       Icons.favorite,
          //       color: ColorsManager.redColor,
          //     ) :const Icon(
          //       Icons.favorite_border_outlined,
          //       color: ColorsManager.gray,
          //     ),
          //     onPressed: () {
          //       function();
          //     }),
          // IconButton(
          //     icon: const FaIcon(
          //       FontAwesomeIcons.share,
          //       color: ColorsManager.gray,
          //     ),
          //     onPressed: () {}),
        ]);
  }
}

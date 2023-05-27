import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/enable_widget.dart';
import 'package:mybookstore/core/widgets/rating_star_widget.dart';
import 'package:mybookstore/domain/blocs/home/home_bloc.dart';
import 'package:mybookstore/pages/home/widgets/field_filter.dart';
import 'package:mybookstore/pages/home/widgets/slider_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.all(0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Text('Filtrar', style: MyBookStoreTextStyles.titleAppBar),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset('assets/icons/ic_close.svg'),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FilterField(
            title: 'Titulo',
            child: TextField(),
          ),
          const SizedBox(height: 10),
          const FilterField(
            title: 'Autor',
            child: TextField(),
          ),
          const SizedBox(height: 10),
          FilterField(
              title: 'Ano\npublicado',
              child: SliderWidget(
                onChanged: (RangeValues) {},
              )),
          const SizedBox(height: 10),
          const FilterField(
              title: 'Rating', child: RatingStarWidget(rating: 0)),
          const SizedBox(height: 10),
          const FilterField(
              title: 'Status', child: EnableWidget(status: false)),
          const SizedBox(height: 80),
          Button(
            onPressed: () {
              Modular.to.pop();
              Modular.get<HomeBloc>().add(FilterListEvent());
            },
            title: 'Filtrar',
          )
        ],
      ),
    );
  }
}

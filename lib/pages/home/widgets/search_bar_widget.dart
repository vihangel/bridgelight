import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/icon_button_widget.dart';
import 'package:mybookstore/pages/home/widgets/filter_widget.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: MyBookStoreColors.background,
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: MyBookStoreTextStyles.titleSmall,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SvgPicture.asset(
                      'assets/icons/ic_search.svg',
                      fit: BoxFit.scaleDown,
                      height: 20,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(12.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          IconButtonWidget(
            icon: 'ic_filter',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => FilterWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}

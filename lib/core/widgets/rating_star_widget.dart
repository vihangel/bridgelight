import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mybookstore/core/utils/colors.dart';

class RatingStarWidget extends StatefulWidget {
  final double rating;
  final ValueChanged<double>? onChanged;

  const RatingStarWidget({
    Key? key,
    required this.rating,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RatingStarWidget> createState() => _RatingStarWidgetState();
}

class _RatingStarWidgetState extends State<RatingStarWidget> {
  double _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    ///Não faz sentido receber double quebrado (ex: 3.5) se estou selecionando estrelas...
    int fullStars = _rating.floor();
    double halfStar = _rating - fullStars;
    int emptyStars = 5 - fullStars - (halfStar > 0 ? 1 : 0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
            fullStars + (halfStar > 0 ? 1 : 0),
            (index) {
              // if (index == fullStars && halfStar > 0) {
              //   return GestureDetector(
              //     onTap: () => _handleTap(index + 0.5),
              //     child:

              //      const Icon(
              //       Icons.star_half,
              //       size: 30,
              //       color: MyBookStoreColors.black,
              //     ),
              //   );
              // }
              return GestureDetector(
                onTap: () => _handleTap(index + 1),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    'assets/icons/ic_star.svg',
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                        MyBookStoreColors.black, BlendMode.srcIn),
                  ),
                ),
              );
            },
          ) +
          List.generate(
            emptyStars,
            (index) => GestureDetector(
              onTap: () =>
                  _handleTap(index + fullStars + (halfStar > 0 ? 1 : 0) + 1),
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  'assets/icons/ic_star.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
    );
  }

  void _handleTap(double value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    setState(() {
      _rating = value;
    });
  }
}

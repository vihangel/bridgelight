import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';

class EnableWidget extends StatefulWidget {
  final bool status;
  final ValueChanged<bool>? onChanged;
  const EnableWidget({super.key, required this.status, this.onChanged});

  @override
  State<EnableWidget> createState() => _EnableWidgetState();
}

class _EnableWidgetState extends State<EnableWidget> {
  bool _status = false;
  @override
  void initState() {
    super.initState();
    _status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _status = !_status;
        });
        widget.onChanged?.call(_status);
      },
      child: Row(
        children: [
          SvgPicture.asset(
              'assets/icons/${_status ? "ic_enabled" : "ic_disabled"}.svg'),
          const SizedBox(width: 16),
          Text(
            'Em estoque',
            style: MyBookStoreTextStyles.titleSmall.copyWith(
              color: MyBookStoreColors.subtitleDark,
            ),
          ),
        ],
      ),
    );
  }
}

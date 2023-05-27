import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/icon_button_widget.dart';
import 'package:mybookstore/core/widgets/image_widget.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';

class CardEmployeeWidget extends StatelessWidget {
  final EmployeeModel employee;
  final Function() onDelete;

  const CardEmployeeWidget(
      {super.key, required this.employee, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 21),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageWidget(
            imageString: employee.photo ?? '',
            borderRadius: BorderRadius.circular(100),
            placeholder: 'avatar',
            height: 48,
            width: 48,
          ),
          const SizedBox(width: 21),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    employee.name,
                    style: MyBookStoreTextStyles.titleAppBar,
                  ),
                ),
                Row(
                  children: [
                    IconButtonWidget(
                      onPressed: () =>
                          Modular.to.pushNamed('/createemployee', arguments: {
                        'employee': employee,
                        'edit': true,
                      }),
                      icon: 'ic_edit',
                    ),
                    const SizedBox(width: 12),
                    IconButtonWidget(
                      onPressed: onDelete,
                      icon: 'ic_delete',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

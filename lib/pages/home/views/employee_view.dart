import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/domain/blocs/employee/employee_bloc.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/pages/home/widgets/card_employee_widget.dart';

class EmployeeView extends StatelessWidget {
  final ScrollController controller = ScrollController();

  EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<EmployeeBloc>().add(GetEmployeeListEvent());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Funcionarios',
          style: MyBookStoreTextStyles.title.copyWith(fontSize: 16),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  Modular.get<EmployeeBloc>().add(GetEmployeeListEvent());
                },
                child: BlocBuilder<EmployeeBloc, EmployeeState>(
                    bloc: Modular.get<EmployeeBloc>(),
                    buildWhen: (previous, current) {
                      if (current is EmployeeSucessState) {
                        Modular.get<EmployeeBloc>().add(GetEmployeeListEvent());
                      }
                      return true;
                    },
                    builder: (context, state) {
                      log('state: $state');
                      if (state is EmployeeLoadedState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          controller: controller,
                          itemBuilder: (context, index) {
                            return CardEmployeeWidget(
                              onDelete: () {
                                final bloc = Modular.get<EmployeeBloc>();
                                bloc.add(DeleteEmployeeEvent(
                                    state.employee[index].id.toString()));
                              },
                              employee: EmployeeModel(
                                name: state.employee[index].name,
                                photo: state.employee[index].photo,
                                id: index,
                                username: state.employee[index].username,
                              ),
                            );
                          },
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110.0),
        child: FloatingActionButton(
          backgroundColor: MyBookStoreColors.black,
          onPressed: () {
            Modular.to.pushNamed('/createemployee', arguments: {'edit': false});
          },
          child: const Icon(
            Icons.add,
            color: MyBookStoreColors.white,
          ),
        ),
      ),
    );
  }
}

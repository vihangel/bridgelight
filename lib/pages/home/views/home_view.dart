import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/domain/blocs/home/home_bloc.dart';
import 'package:mybookstore/pages/home/widgets/card_widget.dart';
import 'package:mybookstore/pages/home/widgets/search_bar_widget.dart';

class HomeView extends StatelessWidget {
  final ScrollController controller = ScrollController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<HomeBloc>().add(GetListEvent());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'MyBookStore',
          style: MyBookStoreTextStyles.title.copyWith(fontSize: 16),
        ),

        // centerTitle: false,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchBarWidget(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  Modular.get<HomeBloc>().add(GetListEvent());
                },
                child: BlocBuilder<HomeBloc, HomeState>(
                    bloc: Modular.get<HomeBloc>(),
                    buildWhen: (previous, current) {
                      return true;
                    },
                    builder: (context, state) {
                      log('state: $state');
                      if (state is HomeLoadedState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.books.length,
                          controller: controller,
                          itemBuilder: (context, index) {
                            return CardWidget(
                              book: state.books[index],
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
    );
  }
}

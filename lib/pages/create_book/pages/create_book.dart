import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/utils/utills.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/enable_widget.dart';
import 'package:mybookstore/core/widgets/rating_star_widget.dart';
import 'package:mybookstore/core/widgets/text_field_label_widget.dart';
import 'package:mybookstore/domain/blocs/book/create_book/create_book_bloc.dart';
import 'package:mybookstore/domain/entities/book_model.dart';
import 'package:mybookstore/domain/entities/create_book_model.dart';
import 'package:validatorless/validatorless.dart';

class CreateBookPages extends StatefulWidget {
  final BookModel? book;
  final bool edit;

  const CreateBookPages({super.key, this.book, required this.edit});

  @override
  State<CreateBookPages> createState() => _CreateBookPagesState();
}

class _CreateBookPagesState extends State<CreateBookPages> {
  final TextEditingController coverController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController authorController = TextEditingController();

  final TextEditingController synopsisController = TextEditingController();

  final TextEditingController yearController = TextEditingController();

  double rating = 0;

  bool status = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit) {
      titleController.text = widget.book!.title;
      authorController.text = widget.book!.author;
      synopsisController.text = widget.book!.synopsis;
      yearController.text = widget.book!.year.toString();
      rating = widget.book!.rating;
      status = widget.book!.available;
      coverController.text = widget.book!.cover ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          widget.edit ? 'Editar livro' : 'Cadastrar livro',
          style: MyBookStoreTextStyles.title,
        ),

        ///Added back button because it was missing on figma
        automaticallyImplyLeading: true,
        centerTitle: false,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFieldLabel(
                  label: 'Imagem de capa',
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  // validator: Validatorless.required('Não pode ser nulo'),
                  controller: coverController,
                  readOnly: true,
                  onTap: () async {
                    coverController.text = await Utils.getImage() ?? '';
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Titulo',
                  margin: const EdgeInsets.only(bottom: 20),
                  controller: titleController,
                  validator: Validatorless.required('Não pode ser nulo'),
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Autor',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.required('Não pode ser nulo'),
                  controller: authorController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Sinopse',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.required('Não pode ser nulo'),
                  controller: synopsisController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Ano de publicação',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.required('Não pode ser nulo'),
                  controller: yearController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Rating', style: MyBookStoreTextStyles.labelMedium),
                      const SizedBox(height: 16),
                      RatingStarWidget(
                        rating: 0,
                        onChanged: (value) {
                          rating = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Status', style: MyBookStoreTextStyles.labelMedium),
                      const SizedBox(height: 16),
                      EnableWidget(
                        status: false,
                        onChanged: (value) {
                          status = value;
                        },
                      )
                    ],
                  ),
                ),
                BlocBuilder<CreateBookBloc, CreateBookState>(
                  bloc: Modular.get<CreateBookBloc>(),
                  buildWhen: (previous, current) {
                    if (previous is CreateBookLoadingState &&
                        current is CreateBookErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(current.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    if (previous is CreateBookLoadingState &&
                        current is CreateBookLoadedState) {
                      Modular.to.pushReplacementNamed('/home');
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return Button(
                      onPressed: () {
                        log('rating: $rating');
                        if (formKey.currentState!.validate()) {
                          final bloc = Modular.get<CreateBookBloc>();
                          final CreateBookModel newBook = CreateBookModel(
                              id: widget.book?.id.toString(),
                              author: authorController.text,
                              cover: coverController.text,
                              rating: rating,
                              available: status,
                              synopsis: synopsisController.text,
                              title: titleController.text,
                              year: int.parse(yearController.text));
                          if (widget.edit) {
                            print('newBook: ${newBook.id}');
                            bloc.add(EditBookEvent(newBook));
                          } else {
                            bloc.add(AddBookEvent(newBook));
                          }
                        }
                      },
                      loading: false,
                      title: 'Salvar',
                      margin: const EdgeInsets.only(bottom: 50, top: 40),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

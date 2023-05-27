import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/image_widget.dart';
import 'package:mybookstore/domain/blocs/book/details_book/details_bloc.dart';
import 'package:mybookstore/domain/entities/book_model.dart';

class BookDetailsPage extends StatelessWidget {
  final BookModel book;
  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Livros',
          style: MyBookStoreTextStyles.title.copyWith(fontSize: 16),
        ),
        automaticallyImplyLeading: true,
        // centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: ImageWidget(
                    imageString: 'aaa',
                    placeholder: 'book_placeholder',
                    width: 152,
                    height: 211,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  book.title,
                  style: MyBookStoreTextStyles.title.copyWith(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  book.author,
                  style: MyBookStoreTextStyles.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                Text(
                  'Sinópse',
                  style: MyBookStoreTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  book.synopsis,
                  style: MyBookStoreTextStyles.bodyLarge,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Publicado em',
                      style: MyBookStoreTextStyles.bodyLarge
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${book.year}',
                      style: MyBookStoreTextStyles.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Publicado em',
                      style: MyBookStoreTextStyles.bodyLarge
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: MyBookStoreColors.black, size: 23),
                        const SizedBox(width: 4),
                        Text(
                          '${book.rating}',
                          style: MyBookStoreTextStyles.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                Button(
                  onPressed: () {
                    Modular.to.pushReplacementNamed('/createbook',
                        arguments: {'book': book, 'edit': true});
                  },
                  loading: false,
                  title: 'Editar',
                  margin: const EdgeInsets.only(bottom: 16, top: 140),
                ),
                BlocBuilder<DetailsBloc, DetailsState>(
                  bloc: Modular.get<DetailsBloc>(),
                  buildWhen: (previous, current) {
                    if (previous is DetailsLoadingState &&
                        current is DetailsErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(current.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    if (previous is DetailsLoadingState &&
                        current is DetailsLoadedState) {
                      Modular.to.pushReplacementNamed('/home');
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return Button.contrast(
                      onPressed: () {
                        final bloc = Modular.get<DetailsBloc>();
                        bloc.add(DeleteBookEvent(book.id.toString()));
                      },
                      loading: false,
                      title: 'Deletar',
                      margin: const EdgeInsets.only(bottom: 50, top: 8),
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

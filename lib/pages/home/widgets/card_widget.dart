import 'package:flutter/material.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/image_widget.dart';
import 'package:mybookstore/domain/entities/book_model.dart';

class CardWidget extends StatelessWidget {
  final BookModel book;

  const CardWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: book);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageWidget(imageString: book.cover ?? ''),
            const SizedBox(width: 21),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: MyBookStoreTextStyles.titleAppBar,
                        ),
                        Text(
                          book.author,
                          style: MyBookStoreTextStyles.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Ano',
                        style: MyBookStoreTextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: MyBookStoreColors.black,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            book.rating.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

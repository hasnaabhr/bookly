import 'package:bookly/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeSearchTextField extends StatelessWidget {
  const CustomeSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? searchValue;
    return Center(
      child: Container(
        height: 60,
        width: 400,
        decoration: const BoxDecoration(
          color: Color(0xffFFD5AC),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  if (searchValue == null) {
                    // Do nothing if searchValue is null
                  } else {
                    BlocProvider.of<SearchBooksCubit>(context)
                        .fetchSimilarBooks(searchText: searchValue!);
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                  color: Color(0xff111111),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  searchValue = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111111),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

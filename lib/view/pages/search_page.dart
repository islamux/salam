import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Page"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: searchController,
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  context.read<BasePageCubit>().searchContent(query);
                  // todo disable temprorly
                }
              },
              decoration: InputDecoration(
                hintText: 'ابحث هنا...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<BasePageCubit, BasePageState>(
        builder: (context, state) {
          if (state is PageSearchResults) {
            final searchResults = state.results;

            if (searchResults.isEmpty) {
              return const Center(child: Text("لا توجد نتائج مطابقة."));
            }

            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final item = searchResults[index];
                return ListTile(
                  title: Text(item.titles?.join(", ") ?? "No Title"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Subtitles: ${item.subtitles?.join(", ") ?? "No Subtitles"}"),
                      Text("Texts: ${item.texts?.join(", ") ?? "No Text"}"),
                      Text("Ayahs: ${item.ayahs?.join(", ") ?? "No Ayahs"}"),
                      Text("Footer: ${item.footer ?? "No Footer"}"),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("يرجى إدخال استعلام للبحث."));
          }
        },
      ),
    );
  }
}

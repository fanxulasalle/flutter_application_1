import 'package:flutter_application_1/components/search_bar.dart';
import 'package:flutter_application_1/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void _onSearch(String value, ViewModel appState) {
    appState.searchAnime(value);
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<ViewModel>();
    return FutureBuilder(
      future: appState.loadAnimes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: const Center(child: Text('Error loading data')),
          );
        }
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DebouncedSearchBar(
                        onSearch: (v) => _onSearch(v, appState),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Anime animeCurrent = appState.animes![index];
                        return Column(
                          children: [
                            Text(animeCurrent.title),
                            Image.network(
                              animeCurrent.images['jpg']['image_url'],
                            ),
                          ],
                        );
                      },
                      itemCount: appState.animes!.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

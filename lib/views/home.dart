import 'package:flutter_application_1/components/search_bar.dart';
import 'package:flutter_application_1/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> _onSearch(String value, ViewModel appState) async {
    await appState.searchAnime(value);
  }

  @override
  Widget build(BuildContext context) {
    final ViewModel appState = context.watch<ViewModel>();
    context.read<ViewModel>().loadAnimes();
    if (appState.animes != null){
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
                      onSearch: (v) async => await _onSearch(v, appState),
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
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return const  Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}

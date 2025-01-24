import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/cubit/cubit/quraan_page_cubit.dart';
import 'package:quraan_app/cubit/cubit/quraan_page_state.dart';
import 'package:quraan_app/models/ayat_sour_model.dart';

class QuranPageView extends StatefulWidget {
  final List<AyatSour> quranData;
  final int initialIndex;

  const QuranPageView({super.key, required this.quranData, required this.initialIndex});

  @override
  State<QuranPageView> createState() => _QuranPageViewState();
}

class _QuranPageViewState extends State<QuranPageView> {
  double fontSize = 26.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuranPageCubit()..setPage(widget.initialIndex),
      child: BlocBuilder<QuranPageCubit, QuranPageState>(
        builder: (context, state) {
          if (state is QuranPageLoaded) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.background,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.blueGrey.shade900.withOpacity(0.9),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), 
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Column(
                    children: [
                      Text(
                        ' ${widget.quranData[state.currentPage].name}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, 
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.format_list_numbered_rounded,
                            size: 14,
                            color: Colors.yellowAccent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.quranData[state.currentPage].ayat} آية',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  elevation: 0,
                ),
                body: PageView.builder(
                  controller: PageController(initialPage: state.currentPage),
                  itemCount: widget.quranData.length,
                  onPageChanged: (page) => context.read<QuranPageCubit>().setPage(page),
                  itemBuilder: (context, index) {
                    final surah = widget.quranData[index];
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 120, 20, 80),
                      child: Column(
                        children: [
                          Card(
                            elevation: 4,
                            shadowColor: Colors.blueAccent.withOpacity(0.2), 
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.deepPurple,
                                    Colors.indigo,
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: -20,
                                    top: -20,
                                    child: Icon(
                                      Icons.star_rounded,
                                      size: 60,
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                  ),
                                  Positioned(
                                    right: -15,
                                    bottom: -15,
                                    child: Icon(
                                      Icons.star_rounded,
                                      size: 50,
                                      color: Colors.white.withOpacity(0.15)
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white, 
                                        shadows: [
                                          Shadow(
                                            color: Colors.black26, 
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Card(
                            elevation: 2,
                            shadowColor: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                surah.displayqoran,
                                style: TextStyle(
                                  fontSize: fontSize,
                                  height: 2.2,
                                  color: Colors.black87, 
                                ),
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                 ),
            );
          }
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
                strokeWidth: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}

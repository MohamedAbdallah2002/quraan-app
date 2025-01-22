import 'package:flutter/material.dart';
import 'package:quraan_app/models/ayat_sour_model.dart';
import 'package:quraan_app/view/screen/quraan_page_view.dart';

class SurahListScreen extends StatelessWidget {
  final List<AyatSour> quranList;

  const SurahListScreen({super.key, required this.quranList});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background, // Updated to match the surface theme
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber, // Updated to static color
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'القرآن الكريم',
                    style: TextStyle(color: Colors.black), // Updated for a black title
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber, // Updated to static color
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white, // Added a custom app bar background color
          elevation: 0.5, // Slight shadow for separation
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: quranList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                elevation: 2,
                shadowColor: Colors.grey.withOpacity(0.3), // Custom shadow color
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranPageView(
                          quranData: quranList,
                          initialIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2), // Updated border color
                        width: 1,
                      ),
                      color: Colors.white, // Updated container color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue.shade600, // Gradient start
                                  Colors.blue.shade300, // Gradient end
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.blueAccent.withOpacity(0.5), // Updated gradient border
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white, // White text for contrast
                                  fontSize: 20,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.3), // Softer shadow for text
                                      offset: const Offset(1, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  quranList[index].name,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                    color: Colors.black, // Black text for clarity
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.format_list_numbered_rounded,
                                      size: 16,
                                      color: Colors.blueAccent, // Updated to blue accent
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${quranList[index].ayat} آية',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.blueGrey, // Softer blue for readability
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.1), // Light background for the icon
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.blueAccent.withOpacity(0.2), // Updated border color
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 16,
                              color: Colors.blueAccent, // Arrow color to match theme
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

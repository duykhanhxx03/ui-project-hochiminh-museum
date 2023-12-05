import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

class ShimmerInnoticeNews extends StatelessWidget {
  const ShimmerInnoticeNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: isDark
            ? const Color.fromARGB(255, 125, 125, 125)
            : Colors.grey.shade300,
        highlightColor: isDark
            ? const Color.fromARGB(255, 174, 173, 173)
            : Colors.grey.shade100,
        // baseColor: Colors.grey.shade300,
        // highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 105,
                padding: const EdgeInsets.all(TSizes.spaceBtwElements),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: isDark
                            ? const Color.fromARGB(255, 59, 59, 59)
                            : Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: isDark
                                      ? const Color.fromARGB(255, 59, 59, 59)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: isDark
                                      ? const Color.fromARGB(255, 59, 59, 59)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

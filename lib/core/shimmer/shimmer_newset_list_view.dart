import 'package:bookly/core/shimmer/shimmer_container_effect.dart';
import 'package:flutter/material.dart';

class ShimmerNewsetListView extends StatelessWidget {
  const ShimmerNewsetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              const AspectRatio(
                aspectRatio: 2.6 / 4,
                child: ShimmerContainerEffect(borderRadius: 16),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShimmerContainerEffect(
                      width: double.infinity,
                      height: 20,
                    ),
                    const SizedBox(height: 3),
                    const ShimmerContainerEffect(
                      width: double.infinity,
                      height: 20,
                    ),
                    const SizedBox(height: 3),
                    const ShimmerContainerEffect(width: 100, height: 16),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ShimmerContainerEffect(width: 40, height: 20),
                        ShimmerContainerEffect(width: 60, height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
    );
  }
}

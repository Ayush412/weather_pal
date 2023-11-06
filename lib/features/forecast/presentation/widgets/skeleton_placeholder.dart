import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonPlaceholder extends StatelessWidget {
  const SkeletonPlaceholder({
    super.key,
    this.shimmerEnabled = true,
    this.buttonTitle = 'Retry',
    this.onTap,
  });
  final bool shimmerEnabled;
  final String buttonTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: shimmerEnabled,
      highlightColor: Colors.white.withOpacity(0.5),
      baseColor: shimmerEnabled
          ? Colors.white.withOpacity(0.08)
          : Colors.white.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Container(
            width: 100,
            height: 28,
            color: Colors.white.withOpacity(0.08),
          ),
          const SizedBox(height: 64),
          const Spacer(),
          if (onTap != null && !shimmerEnabled) ...[
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            )
          ],
          const Spacer(),
          const SizedBox(height: 64),
          Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            children: List.generate(
              4,
              (index) => Container(
                height: 120,
                width: (MediaQuery.of(context).size.width - (24 * 5)) / 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

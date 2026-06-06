import 'package:flutter/material.dart';
import 'dart:math';

/// A reusable pagination widget for dashboard tables
class DashboardPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final Function(int) onPageTap;

  const DashboardPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPrevious,
    this.onNext,
    required this.onPageTap,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) {
      return const SizedBox.shrink();
    }

    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous button
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(Icons.chevron_left, size: 20),
            color: currentPage > 1
                ? const Color(0xFF666666)
                : const Color(0xFFCCCCCC),
            tooltip: 'Previous page',
          ),
          const SizedBox(width: 8),

          // Page numbers
          ..._buildPageNumbers(),

          const SizedBox(width: 8),
          // Next button
          IconButton(
            onPressed: onNext,
            icon: const Icon(Icons.chevron_right, size: 20),
            color: currentPage < totalPages
                ? const Color(0xFF666666)
                : const Color(0xFFCCCCCC),
            tooltip: 'Next page',
          ),
        ],
      ),
    );
  }

  /// Build page number widgets
  List<Widget> _buildPageNumbers() {
    List<Widget> pageNumbers = [];

    // Always show first page
    if (currentPage > 3) {
      pageNumbers.add(_buildPageNumber(1, false));
      if (currentPage > 4) {
        pageNumbers.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text('...', style: TextStyle(color: Color(0xFF666666))),
          ),
        );
      }
    }

    // Show pages around current page
    for (
      int i = max(1, currentPage - 2);
      i <= min(totalPages, currentPage + 2);
      i++
    ) {
      pageNumbers.add(_buildPageNumber(i, i == currentPage));
      if (i < min(totalPages, currentPage + 2)) {
        pageNumbers.add(const SizedBox(width: 4));
      }
    }

    // Always show last page
    if (currentPage < totalPages - 2) {
      if (currentPage < totalPages - 3) {
        pageNumbers.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text('...', style: TextStyle(color: Color(0xFF666666))),
          ),
        );
      }
      pageNumbers.add(_buildPageNumber(totalPages, false));
    }

    return pageNumbers;
  }

  /// Build individual page number widget
  Widget _buildPageNumber(int number, bool isActive) {
    return InkWell(
      onTap: () => onPageTap(number),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2196F3) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isActive ? const Color(0xFF2196F3) : const Color(0xFFE0E0E0),
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF333333),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

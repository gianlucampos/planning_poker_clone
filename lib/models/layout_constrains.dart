enum LayoutTypeEnum { mobile, desktop }

class LayoutConstraints {
  final double height;
  final double width;
  final LayoutTypeEnum typeLayout;

  const LayoutConstraints({
    required this.height,
    required this.width,
    required this.typeLayout,
  });

  factory LayoutConstraints.mobile() {
    return const LayoutConstraints(
      height: 780,
      width: 780,
      typeLayout: LayoutTypeEnum.mobile,
    );
  }
}

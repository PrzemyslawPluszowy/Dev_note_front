import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:p_models/models.dart';
import 'package:p_utils/p_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

///Widget do wyboru ikony z listy ikon Phosphor
///Implementacja z wykorzystaniem [HookWidget] oraz [GridView.builder]
///wykorzystuje paczkę z enumami p_models

class IconSelector extends HookWidget {
  const IconSelector({
    required this.onIconSelected,
    super.key,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.crossAxisCount,
  });

  ///Callback funkcja w momencie wybrania ikony
  final void Function(ApiPhosphorIcons) onIconSelected;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final int? crossAxisCount;

  @override
  Widget build(BuildContext context) {
    final selectedIcon = useState<ApiPhosphorIcons?>(null);
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: ApiPhosphorIcons.values.length,
      itemBuilder: (context, index) {
        final iconData = ApiPhosphorIcons.values[index].icon;
        return GestureDetector(
          key: ValueKey(ApiPhosphorIcons.values[index]),
          onTap: () {
            selectedIcon.value = ApiPhosphorIcons.values[index];
            onIconSelected(
              ApiPhosphorIcons.values[index],
            ); // wywołanie callbacka
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedIcon.value == ApiPhosphorIcons.values[index]
                    ? Colors.blue
                    : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(Sizes.p4),
              color: selectedIcon.value == ApiPhosphorIcons.values[index]
                  ? Colors.blue.withAlpha(50)
                  : Colors.transparent,
            ),
            child: Center(
              child: PhosphorIcon(
                iconData,
                size: Sizes.p16,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/extensions/translation_api_exception.dart';
import 'package:dev_note/core/utils/di.dart';
import 'package:dev_note/pages/board/cubit/board_get_cubit.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/notifier/active_board_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p_repositories/repositories.dart';
import 'package:p_shared_ui/p_shared_ui.dart';
import 'package:p_utils/p_utils.dart';

@RoutePage()
class BoardPage extends StatefulWidget {
  const BoardPage({
    @PathParam('boardId') required this.boardId,
    super.key,
  });

  final String boardId;

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveBoardNotifier.instance.setActiveBoard(widget.boardId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardGetCubit(
        workItemRepository: getIt<WorkItemRepository>(),
        boardRepository: getIt<BoardRepository>(),
        boardId: widget.boardId,
      ),
      child: BoardMainScreen(id: widget.boardId),
    );
  }
}

/// Główny ekran tablicy z drag & drop funkcjonalnością
class BoardMainScreen extends StatelessWidget {
  const BoardMainScreen({required this.id, super.key});

  final String id;

  /// Uniwersalna funkcja do przenoszenia work itemów między kategoriami i pozycjami
  void _moveWorkItem(
    BuildContext context, {
    required WorkItemModel workItem,
    required String destinationCategoryId,
    required String sourceCategoryId,
    required int newOrder,
    String? newParentWorkItemId,
  }) {
    unawaited(
      context.read<BoardGetCubit>().moveItem(
        workItemId: workItem.id,
        workItemReorder: WorkItemReorder(
          destinationCategoryId: destinationCategoryId,
          sourceCategoryId: sourceCategoryId,
          newOrder: newOrder,
          position: MovePosition.atIndex,
          newParentWorkItemId: newParentWorkItemId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<BoardGetCubit, BoardGetState>(
        listener: (context, state) {
          if (state case BoardGetSuccess(:final exception)) {
            if (exception != null) {
              WebToast.showTop(
                toast: ToastData(
                  type: WebToastType.error,
                  message: (exception is ApiException) ? exception.message : exception.toString(),
                ),
                context: context,
                duration: const Duration(seconds: 5),
              );
            }
            context.read<BoardGetCubit>().clearException();
          }
        },
        builder: (context, state) {
          if (state case BoardGetSuccess(:final boardData)) {
            return Column(
              children: [
                gapH12,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: NestedDragDropBoard<BoardCategoryModel, WorkItemModel, WorkItemModel>(
                      categoryDropPlaceholder: (isHovering) {
                        return _DropPlaceholder(
                          isHovering: isHovering,
                          hoverHeight: 60,
                          normalHeight: 5,
                          color: Colors.blue,
                          text: 'Drop category here',
                        );
                      },
                      emptySubItemDropPlaceholder: (isHovering) {
                        return _DropPlaceholder(
                          isHovering: isHovering,
                          hoverHeight: 40,
                          normalHeight: 5,
                          color: Colors.green,
                          text: 'Drop sub-item here',
                        );
                      },
                      itemHoverDecorationBuilder: (isHovering) {
                        return isHovering
                            ? BoxDecoration(
                                border: Border.all(color: Colors.orange, width: 2),
                                borderRadius: BorderRadius.circular(4),
                              )
                            : null;
                      },
                      categoryHoverDecorationBuilder: (isHovering) {
                        return isHovering ? const BoxDecoration() : null;
                      },
                      subItemDropPlaceholder: (isHovering) {
                        return _DropPlaceholder(
                          isHovering: isHovering,
                          hoverHeight: 30,
                          normalHeight: 7,
                          color: Colors.green,
                          text: 'Drop sub-item here',
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        );
                      },
                      categoryContainerBuilder: (child, category, isHovering) {
                        return _CategoryContainer(
                          category: category,
                          isHovering: isHovering,
                          child: child,
                        );
                      },
                      getCategoryKey: (category) => category.id,
                      getItemKey: (item) => item.id,
                      getSubItemKey: (subItem) => subItem.id,
                      categories: boardData.categories,

                      // Get items from category
                      getItemsFromCategory: (category) => category.workItems,

                      // Get sub-items from item
                      getSubItemsFromItem: (item) => item.subWorkItems,

                      // Category builder (header)
                      categoryBuilder: (category, index) {
                        return _CategoryHeader(
                          category: category,
                          onAddItem: () {
                            unawaited(
                              context.read<BoardGetCubit>().createWorkItem(
                                WorkItemCreate(
                                  title: 'New Item ${math.Random().nextInt(1000)}',
                                  boardId: category.boardId,
                                  categoryId: category.id,
                                ),
                              ),
                            );
                          },
                        );
                      },

                      // Item builder
                      itemBuilder: (item, categoryIndex, itemIndex) {
                        return _WorkItemTile(
                          title: item.title,
                          description: item.description,
                          margin: const EdgeInsets.only(left: 24, right: 4),
                          padding: const EdgeInsets.all(4),
                        );
                      },

                      // Sub-item builder
                      subItemBuilder: (subItem, itemIndex, subItemIndex) {
                        return _WorkItemTile(
                          title: subItem.title,
                          description: subItem.description,
                          margin: const EdgeInsets.only(left: Sizes.p48, right: 4, top: 2, bottom: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          isSubItem: true,
                        );
                      },

                      // Category reorder callback
                      onCategoryReorder: (oldIndex, newIndex) {
                        unawaited(
                          context.read<BoardGetCubit>().reorderCategories(oldIndex, newIndex),
                        );
                      },

                      // Item move callback (drop AFTER item)
                      onItemMove: (item, fromCategoryIndex, toCategoryIndex, toItemIndex) {
                        _moveWorkItem(
                          context,
                          workItem: item,
                          destinationCategoryId: boardData.categories[toCategoryIndex].id,
                          sourceCategoryId: boardData.categories[fromCategoryIndex].id,
                          newOrder: toItemIndex,
                        );
                      },

                      // Item to sub-item conversion callback (drop ON item)
                      onItemToSubItem: (item, fromCategoryIndex, toCategoryIndex, toItemIndex) {
                        final targetItem = boardData.categories[toCategoryIndex].workItems[toItemIndex];
                        _moveWorkItem(
                          context,
                          workItem: item,
                          destinationCategoryId: boardData.categories[toCategoryIndex].id,
                          sourceCategoryId: boardData.categories[fromCategoryIndex].id,
                          newOrder: 0,
                          newParentWorkItemId: targetItem.id,
                        );
                      },

                      // Sub-item to item conversion callback (drop in item area)
                      onSubItemToItem: (subItem, fromCategoryIndex, fromItemIndex, toCategoryIndex, toItemIndex) {
                        _moveWorkItem(
                          context,
                          workItem: subItem,
                          destinationCategoryId: boardData.categories[toCategoryIndex].id,
                          sourceCategoryId: subItem.categoryId,
                          newOrder: toItemIndex,
                        );
                      },

                      // Sub-item move callback
                      onSubItemMove:
                          (
                            subItem,
                            fromCategoryIndex,
                            fromItemIndex,
                            toCategoryIndex,
                            toItemIndex,
                            toSubItemIndex,
                          ) {
                            final destinationCategory = boardData.categories[toCategoryIndex];
                            final targetParentItem = destinationCategory.workItems[toItemIndex];

                            // Dostosuj indeks jeśli przesuwamy w tej samej kategorii rodzica
                            var adjustedIndex = toSubItemIndex;
                            if (fromCategoryIndex == toCategoryIndex && fromItemIndex == toItemIndex) {
                              // Przesuwamy w tym samym rodzicu
                              final fromSubItemIndex = targetParentItem.subWorkItems.indexWhere(
                                (si) => si.id == subItem.id,
                              );

                              if (fromSubItemIndex != -1 && fromSubItemIndex < toSubItemIndex) {
                                // Przesuwamy w dół - dostosuj indeks
                                adjustedIndex = toSubItemIndex - 1;
                              }
                            }

                            _moveWorkItem(
                              context,
                              workItem: subItem,
                              destinationCategoryId: destinationCategory.id,
                              sourceCategoryId: subItem.categoryId,
                              newOrder: adjustedIndex,
                              newParentWorkItemId: targetParentItem.id,
                            );
                          },

                      // Custom feedback for category drag
                      categoryDragFeedback: (category) {
                        return _DragFeedback(
                          foregroundColor: category.color.toFlutterColor().computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white,
                          icon: Icons.folder,
                          text: category.name,
                          backgroundColor: category.color.toFlutterColor().withAlpha(150),
                        );
                      },

                      // Custom feedback for item drag
                      itemDragFeedback: (item) {
                        return _DragFeedback(
                          icon: Icons.text_snippet,
                          text: item.title,
                          backgroundColor: context.colorScheme.primary.withValues(alpha: 0.7),
                          additionalWrapper: (child) => Transform.translate(
                            offset: const Offset(30, 0),
                            child: Opacity(
                              opacity: 0.7,
                              child: child,
                            ),
                          ),
                        );
                      },

                      // Drop placeholders
                      itemDropPlaceholder: (isHovering) {
                        return _DropPlaceholder(
                          isHovering: isHovering,
                          hoverHeight: 50,
                          normalHeight: 4,
                          color: Colors.blue,
                          text: 'Drop item here',
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                        );
                      },

                      // Custom feedback for sub-item drag
                      subItemDragFeedback: (subItem) {
                        return _DragFeedback(
                          icon: Icons.subdirectory_arrow_right,
                          text: subItem.title,
                          backgroundColor: Colors.green.withValues(alpha: 0.7),
                          widthFactor: 0.5,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

/// Uniwersalny widget kontenera dla kategorii z animacjami hover
class _CategoryContainer extends StatelessWidget {
  const _CategoryContainer({
    required this.child,
    required this.category,
    required this.isHovering,
  });

  final Widget child;
  final BoardCategoryModel category;
  final bool isHovering;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isHovering ? Theme.of(context).colorScheme.primary.withAlpha(30) : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isHovering
              ? Theme.of(context).colorScheme.primary.withAlpha(150)
              : Theme.of(context).colorScheme.outline.withAlpha(50),
          width: isHovering ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isHovering ? 20 : 10),
            blurRadius: isHovering ? 6 : 4,
            offset: Offset(0, isHovering ? 3 : 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Uniwersalny widget nagłówka kategorii z przyciskiem dodawania nowych itemów
class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({
    required this.category,
    required this.onAddItem,
  });

  final BoardCategoryModel category;
  final VoidCallback onAddItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
        color: category.color.toFlutterColor().withAlpha(30),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: category.color.toFlutterColor().withAlpha(100),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            onPressed: onAddItem,
            icon: Icon(
              Icons.add,
              size: 16,
              color: category.color.toFlutterColor(),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              category.name,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: category.color.toFlutterColor().withAlpha(200),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Uniwersalny widget dla feedbacku podczas przeciągania elementów
class _DragFeedback extends StatelessWidget {
  const _DragFeedback({
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.widthFactor = 0.6,
    this.additionalWrapper,
    this.foregroundColor = Colors.white,
  });

  final IconData icon;
  final String text;
  final Color? backgroundColor;
  final double widthFactor;
  final Widget Function(Widget child)? additionalWrapper;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final content = Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: MediaQuery.sizeOf(context).width * widthFactor,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: foregroundColor),
            gapW12,
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: foregroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );

    return additionalWrapper?.call(content) ?? content;
  }
}

/// Uniwersalny widget dla placeholderów drop - wyświetla się gdy element jest przeciągany nad danym obszarem
class _DropPlaceholder extends StatelessWidget {
  const _DropPlaceholder({
    required this.isHovering,
    required this.hoverHeight,
    required this.normalHeight,
    required this.color,
    required this.text,
    this.margin,
  });

  final bool isHovering;
  final double hoverHeight;
  final double normalHeight;
  final Color color;
  final String text;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHovering ? hoverHeight : normalHeight,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isHovering ? color.withAlpha(100) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: isHovering ? Border.all(color: color.withAlpha(100), width: 2) : null,
      ),
      child: isHovering
          ? Center(
              child: Text(
                text,
                style: TextStyle(color: color, fontSize: 12),
              ),
            )
          : null,
    );
  }
}

/// Uniwersalny widget dla wyświetlania work itemów (zarówno głównych itemów jak i sub-itemów)
class _WorkItemTile extends StatelessWidget {
  const _WorkItemTile({
    required this.title,
    required this.margin,
    required this.padding,
    this.description,
    this.isSubItem = false,
  });

  final String title;
  final String? description;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isSubItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: isSubItem
            ? Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(50)
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(isSubItem ? 4 : 6),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(isSubItem ? 30 : 50),
        ),
        boxShadow: isSubItem
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: isSubItem
          ? Row(
              children: [
                Icon(
                  Icons.subdirectory_arrow_right,
                  size: 12,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (description != null)
                        Text(
                          description!,
                          style: context.textTheme.bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.drag_indicator,
                      size: 14,
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        title,
                        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
    );
  }
}

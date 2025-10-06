import 'dart:async';
import 'dart:math' as Math;

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

class BoardMainScreen extends StatelessWidget {
  const BoardMainScreen({required this.id, super.key});

  final String id;

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
                  child: NestedDragDropBoard<BoardCategoryModel, WorkItemModel, WorkItemModel>(
                    categoryDropPlaceholder: (isHovering) {
                      return Container(
                        height: isHovering ? 60 : 5,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isHovering ? Colors.blue.withAlpha(100) : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: isHovering ? Border.all(color: Colors.blue.withAlpha(100), width: 2) : null,
                        ),
                        child: isHovering
                            ? const Center(
                                child: Text(
                                  'Drop category here',
                                  style: TextStyle(color: Colors.blue, fontSize: 12),
                                ),
                              )
                            : null,
                      );
                    },
                    emptySubItemDropPlaceholder: (isHovering) {
                      return Container(
                        height: isHovering ? 40 : 5,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isHovering ? Colors.green.withAlpha(100) : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: isHovering ? Border.all(color: Colors.green.withAlpha(100), width: 2) : null,
                        ),
                        child: isHovering
                            ? const Center(
                                child: Text(
                                  'Drop sub-item here',
                                  style: TextStyle(color: Colors.green, fontSize: 12),
                                ),
                              )
                            : null,
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
                    subItemDropPlaceholder: (isHovering) {
                      return Container(
                        height: isHovering ? 30 : 5,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isHovering ? Colors.green.withAlpha(100) : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: isHovering ? Border.all(color: Colors.green.withAlpha(100), width: 2) : null,
                        ),
                        child: isHovering
                            ? const Center(
                                child: Text(
                                  'Drop sub-item here',
                                  style: TextStyle(color: Colors.green, fontSize: 12),
                                ),
                              )
                            : null,
                      );
                    },
                    categoryContainerBuilder: (child, category, isHovering) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(top: 8, bottom: 4),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isHovering
                              ? Theme.of(context).colorScheme.primary.withAlpha(30)
                              : Theme.of(context).colorScheme.surface,
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
                              onPressed: () {
                                unawaited(
                                  context.read<BoardGetCubit>().createWorkItem(
                                    WorkItemCreate(
                                      title: 'New Item ${Math.Random().nextInt(1000)}',
                                      boardId: category.boardId,
                                      categoryId: category.id,
                                    ),
                                  ),
                                );
                              },
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
                    },

                    // Item builder
                    itemBuilder: (item, categoryIndex, itemIndex) {
                      return Container(
                        margin: const EdgeInsets.only(left: 24, right: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline.withAlpha(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(10),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
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
                                    item.title,
                                    style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            if (item.description != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                item.description!,
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
                    },

                    // Sub-item builder
                    subItemBuilder: (subItem, itemIndex, subItemIndex) {
                      return Container(
                        margin: const EdgeInsets.only(left: Sizes.p48, right: 4, top: 2, bottom: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(50),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline.withAlpha(30),
                          ),
                        ),
                        child: Row(
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
                                    subItem.title,
                                    style: context.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (subItem.description != null)
                                    Text(
                                      subItem.description!,
                                      style: context.textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      print(
                        'onItemMove called: item=${item.title}, fromCat=$fromCategoryIndex, toCat=$toCategoryIndex, toItem=$toItemIndex',
                      );
                      final destinationCategoryId = boardData.categories[toCategoryIndex].id;
                      final sourceCategoryId = boardData.categories[fromCategoryIndex].id;

                      unawaited(
                        context.read<BoardGetCubit>().moveItem(
                          workItemId: item.id,
                          workItemReorder: WorkItemReorder(
                            destinationCategoryId: destinationCategoryId,
                            sourceCategoryId: sourceCategoryId,
                            newOrder: toItemIndex,
                            position: MovePosition.atIndex,
                          ),
                        ),
                      );
                    },

                    // Item to sub-item conversion callback (drop ON item)
                    onItemToSubItem: (item, fromCategoryIndex, toCategoryIndex, toItemIndex) {
                      print(
                        'onItemToSubItem called: item=${item.title}, fromCat=$fromCategoryIndex, toCat=$toCategoryIndex, toItem=$toItemIndex',
                      );
                      final destinationCategoryId = boardData.categories[toCategoryIndex].id;
                      final sourceCategoryId = boardData.categories[fromCategoryIndex].id;
                      final targetItem = boardData.categories[toCategoryIndex].workItems[toItemIndex];

                      unawaited(
                        context.read<BoardGetCubit>().moveItem(
                          workItemId: item.id,
                          workItemReorder: WorkItemReorder(
                            destinationCategoryId: destinationCategoryId,
                            sourceCategoryId: sourceCategoryId,
                            newOrder: 0, // first sub-item
                            position: MovePosition.atIndex,
                            newParentWorkItemId: targetItem.id, // this makes it a sub-item
                          ),
                        ),
                      );
                    },

                    // Sub-item to item conversion callback (drop in item area)
                    onSubItemToItem: (subItem, fromCategoryIndex, fromItemIndex, toCategoryIndex, toItemIndex) {
                      print(
                        'onSubItemToItem called: subItem=${subItem.title}, fromCat=$fromCategoryIndex, fromItem=$fromItemIndex, toCat=$toCategoryIndex, toItem=$toItemIndex',
                      );
                      final destinationCategoryId = boardData.categories[toCategoryIndex].id;
                      final sourceCategoryId = subItem.categoryId;

                      unawaited(
                        context.read<BoardGetCubit>().moveItem(
                          workItemId: subItem.id,
                          workItemReorder: WorkItemReorder(
                            destinationCategoryId: destinationCategoryId,
                            sourceCategoryId: sourceCategoryId,
                            newOrder: toItemIndex,
                            position: MovePosition.atIndex,
                          ),
                        ),
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
                          print(
                            'onSubItemMove called: subItem=${subItem.title}, fromCat=$fromCategoryIndex, fromItem=$fromItemIndex, toCat=$toCategoryIndex, toItem=$toItemIndex, toSubItem=$toSubItemIndex',
                          );
                          final destinationCategory = boardData.categories[toCategoryIndex];
                          final targetParentItem = destinationCategory.workItems[toItemIndex];

                          // Adjust index if moving within same parent item
                          var adjustedIndex = toSubItemIndex;
                          if (fromCategoryIndex == toCategoryIndex && fromItemIndex == toItemIndex) {
                            // Moving within same parent
                            final fromSubItemIndex = targetParentItem.subWorkItems.indexWhere(
                              (si) => si.id == subItem.id,
                            );

                            if (fromSubItemIndex != -1 && fromSubItemIndex < toSubItemIndex) {
                              // Moving down - adjust index
                              adjustedIndex = toSubItemIndex - 1;
                            }
                          }

                          unawaited(
                            context.read<BoardGetCubit>().moveItem(
                              workItemId: subItem.id,
                              workItemReorder: WorkItemReorder(
                                destinationCategoryId: destinationCategory.id,
                                sourceCategoryId: subItem.categoryId,
                                newOrder: adjustedIndex,
                                position: MovePosition.atIndex,
                                newParentWorkItemId: targetParentItem.id,
                              ),
                            ),
                          );
                        },

                    // Custom feedback for category drag
                    categoryDragFeedback: (category) {
                      return Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: Math.min(300, MediaQuery.sizeOf(context).width * 0.8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: category.color.toFlutterColor(),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.folder, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                category.name,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },

                    // Custom feedback for item drag (czerwony jak chciałeś!)
                    itemDragFeedback: (item) {
                      return Transform.translate(
                        offset: const Offset(30, 0), // przesuwa w prawo o 30px
                        child: Opacity(
                          opacity: 0.7, // zmniejsza przezroczystość
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.text_snippet),
                                  gapH12,
                                  Expanded(
                                    child: Text(
                                      item.title,
                                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },

                    // Drop placeholders
                    itemDropPlaceholder: (isHovering) {
                      return Container(
                        height: isHovering ? 50 : 4,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: isHovering ? Colors.blue.withAlpha(100) : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: isHovering ? Border.all(color: Colors.blue.withAlpha(100), width: 2) : null,
                        ),
                        child: isHovering
                            ? const Center(
                                child: Text(
                                  'Drop item here',
                                  style: TextStyle(color: Colors.blue, fontSize: 12),
                                ),
                              )
                            : null,
                      );
                    },

                    // Custom feedback for sub-item drag
                    subItemDragFeedback: (subItem) {
                      return Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.subdirectory_arrow_right, color: Colors.white, size: 12),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  subItem.title,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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

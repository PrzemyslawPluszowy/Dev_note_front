import 'package:flutter/material.dart';

/// Widget do obsługi przeciągania i upuszczania (drag & drop) z 3-poziomową strukturą:
/// Kategorie -> Elementy -> Pod-elementy
///
/// ## Opis
/// Ten widget dostarcza tylko logikę przeciągania elementów, bez żadnych wbudowanych stylów.
/// Całe stylowanie powinno być wykonane przez funkcje builderów przekazane jako parametry.
///
/// ## Struktura danych
/// - **Kategorie** - najwyższy poziom, można przeciągać między sobą
/// - **Elementy** - wewnątrz kategorii, można przeciągać między kategoriami i w obrębie kategorii
/// - **Pod-elementy** - wewnątrz elementów, można przeciągać między elementami
///
/// ## Wymagane parametry
/// - `categories` - lista kategorii do wyświetlenia
/// - `categoryBuilder` - funkcja budująca widget kategorii
/// - `itemBuilder` - funkcja budująca widget elementu
/// - `subItemBuilder` - funkcja budująca widget pod-elementu
/// - `getItemsFromCategory` - funkcja zwracająca listę elementów z kategorii
/// - `getSubItemsFromItem` - funkcja zwracająca listę pod-elementów z elementu
/// - `getCategoryKey` - funkcja zwracająca unikalny klucz dla kategorii
/// - `getItemKey` - funkcja zwracająca unikalny klucz dla elementu
/// - `getSubItemKey` - funkcja zwracająca unikalny klucz dla pod-elementu
///
/// ## Opcjonalne parametry - Callbacki
/// - `onCategoryReorder` - wywoływany gdy kategorie są przestawiane
/// - `onItemMove` - wywoływany gdy element jest przenoszony między kategoriami
/// - `onSubItemMove` - wywoływany gdy pod-element jest przenoszony między elementami
///
/// ## Opcjonalne parametry - Feedback (widgety podczas przeciągania)
/// - `categoryDragFeedback` - widget pokazywany podczas przeciągania kategorii
/// - `itemDragFeedback` - widget pokazywany podczas przeciągania elementu
/// - `subItemDragFeedback` - widget pokazywany podczas przeciągania pod-elementu
///
/// ## Opcjonalne parametry - Drop placeholders (miejsca upuszczenia)
/// - `categoryDropPlaceholder` - widget pokazywany gdzie zostanie upuszczona kategoria
/// - `itemDropPlaceholder` - widget pokazywany gdzie zostanie upuszczony element
///
/// ## Opcjonalne parametry - Kontenery
/// - `categoryContainerBuilder` - funkcja opakowująca całą sekcję kategorii (np. dodanie ramki, tła)
///
/// ## Opcjonalne parametry - Dekoracje
/// - `itemHoverDecorationBuilder` - funkcja zwracająca dekorację dla elementu podczas hover (gdy przeciągany element jest nad nim)
/// - `categoryHoverDecorationBuilder` - funkcja zwracająca dekorację dla kategorii podczas hover (gdy przeciągana kategoria jest nad nią)
///
/// ## Przykład użycia
/// ```dart
/// NestedDragDropBoard<Category, Item, SubItem>(
///   categories: myCategories,
///   getCategoryKey: (cat) => cat.id,
///   getItemKey: (item) => item.id,
///   getSubItemKey: (sub) => sub.id,
///   getItemsFromCategory: (cat) => cat.items,
///   getSubItemsFromItem: (item) => item.subItems,
///
///   // Buildery - pełna kontrola nad wyglądem
///   categoryBuilder: (category, index) => Container(
///     padding: EdgeInsets.all(16),
///     child: Text(category.name, style: TextStyle(fontSize: 20)),
///   ),
///
///   itemBuilder: (item, catIndex, itemIndex) => Card(
///     child: ListTile(title: Text(item.title)),
///   ),
///
///   subItemBuilder: (subItem, itemIndex, subIndex) => Padding(
///     padding: EdgeInsets.only(left: 32),
///     child: Text(subItem.name),
///   ),
///
///   ),

// Własne widgety podczas przeciągania
///   categoryDragFeedback: (category) => Material(
///     child: Container(
///       padding: EdgeInsets.all(16),
///       color: Colors.blue,
///       child: Text(category.name, style: TextStyle(color: Colors.white)),
///     ),
///   ),
///
///   itemDragFeedback: (item) => Material(
///     child: Container(
///       padding: EdgeInsets.all(12),
///       color: Colors.red,
///       child: Text(item.title, style: TextStyle(color: Colors.white)),
///     ),
///   ),
///
///   // Własne placeholdery dla miejsc upuszczenia
///   categoryDropPlaceholder: (isHovering) => Container(
///     height: isHovering ? 60 : 4,
///     color: Colors.purple.withOpacity(isHovering ? 0.5 : 0.2),
///   ),
///
///   // Callbacki - co się dzieje po upuszczeniu
///   onCategoryReorder: (oldIndex, newIndex) {
///     // Przestaw kategorie
///   },
///
///   onItemMove: (item, fromCat, toCat, toIndex) {
///     // Przenieś element między kategoriami
///   },
/// )
/// ```
///
/// ## Uwagi
/// - Widget nie zawiera żadnych wbudowanych stylów
/// - Wszystkie kolory, rozmiary, marginesy etc. są kontrolowane przez użytkownika
/// - Callbacki są opcjonalne - widget może działać bez nich (np. w trybie podglądu)
/// - Feedback widgety domyślnie pokazują oryginalny widget opakowany w `Material`
class NestedDragDropBoard<TCategory, TItem, TSubItem> extends StatefulWidget {
  const NestedDragDropBoard({
    required this.categories,
    required this.categoryBuilder,
    required this.itemBuilder,
    required this.subItemBuilder,
    required this.getItemsFromCategory,
    required this.getSubItemsFromItem,
    required this.getCategoryKey,
    required this.getItemKey,
    required this.getSubItemKey,
    required this.categoryDropPlaceholder,
    required this.itemDropPlaceholder,
    required this.subItemDropPlaceholder,
    required this.emptySubItemDropPlaceholder,
    required this.itemHoverDecorationBuilder,
    required this.categoryHoverDecorationBuilder,
    this.onCategoryReorder,
    this.onItemMove,
    this.onSubItemMove,
    this.onItemToSubItem,
    this.onSubItemToItem,
    this.categoryDragFeedback,
    this.itemDragFeedback,
    this.subItemDragFeedback,
    this.categoryContainerBuilder,
    super.key,
  });

  /// Lista kategorii do wyświetlenia
  final List<TCategory> categories;

  // === BUILDERY - użytkownik dostarcza całe stylowanie ===

  /// Funkcja budująca widget nagłówka kategorii
  final Widget Function(TCategory category, int index) categoryBuilder;

  /// Funkcja budująca widget elementu
  final Widget Function(TItem item, int categoryIndex, int itemIndex)
  itemBuilder;

  /// Funkcja budująca widget pod-elementu
  final Widget Function(TSubItem subItem, int itemIndex, int subItemIndex)
  subItemBuilder;

  // === AKCESORY DANYCH ===

  /// Funkcja zwracająca listę elementów z kategorii
  final List<TItem> Function(TCategory category) getItemsFromCategory;

  /// Funkcja zwracająca listę pod-elementów z elementu
  final List<TSubItem> Function(TItem item) getSubItemsFromItem;

  // === KLUCZE ===

  /// Funkcja zwracająca unikalny klucz dla kategorii (np. ID)
  final String Function(TCategory category) getCategoryKey;

  /// Funkcja zwracająca unikalny klucz dla elementu (np. ID)
  final String Function(TItem item) getItemKey;

  /// Funkcja zwracająca unikalny klucz dla pod-elementu (np. ID)
  final String Function(TSubItem subItem) getSubItemKey;

  // === CALLBACKI - opcjonalne ===

  /// Wywoływany gdy kategorie są przestawiane
  final void Function(int oldIndex, int newIndex)? onCategoryReorder;

  /// Wywoływany gdy element jest przenoszony
  final void Function(
    TItem item,
    int fromCategoryIndex,
    int toCategoryIndex,
    int toItemIndex,
  )?
  onItemMove;

  /// Wywoływany gdy pod-element jest przenoszony
  final void Function(
    TSubItem subItem,
    int fromCategoryIndex,
    int fromItemIndex,
    int toCategoryIndex,
    int toItemIndex,
    int toSubItemIndex,
  )?
  onSubItemMove;

  /// Wywoływany gdy element jest zamieniany na sub-item (najechanie na inny element)
  final void Function(
    TItem item,
    int fromCategoryIndex,
    int toCategoryIndex,
    int toItemIndex, // element nad którym najeżdżamy staje się parentem
  )?
  onItemToSubItem;

  /// Wywoływany gdy sub-item jest zamieniany na główny item (drop w miejscu głównych itemów)
  final void Function(
    TSubItem subItem,
    int fromCategoryIndex,
    int fromItemIndex,
    int toCategoryIndex,
    int toItemIndex, // pozycja w głównych itemach
  )?
  onSubItemToItem;

  // === FEEDBACK - widgety podczas przeciągania ===

  /// Widget pokazywany podczas przeciągania kategorii
  final Widget Function(TCategory category)? categoryDragFeedback;

  /// Widget pokazywany podczas przeciągania elementu
  final Widget Function(TItem item)? itemDragFeedback;

  /// Widget pokazywany podczas przeciągania pod-elementu
  final Widget Function(TSubItem subItem)? subItemDragFeedback;

  // === DROP PLACEHOLDERS - miejsca upuszczenia ===

  /// Widget w miejscu gdzie kategoria zostanie upuszczona
  final Widget Function(bool isHovering) categoryDropPlaceholder;

  /// Widget w miejscu gdzie element zostanie upuszczony
  final Widget Function(bool isHovering) itemDropPlaceholder;

  /// Widget w miejscu gdzie pod-element zostanie upuszczony
  final Widget Function(bool isHovering) subItemDropPlaceholder;

  /// Widget w miejscu gdzie pod-element zostanie upuszczony gdy element nie ma pod-elementów
  final Widget Function(bool isHovering) emptySubItemDropPlaceholder;

  // === KONTENERY ===

  /// Funkcja opakowująca całą sekcję kategorii (ramka, tło, cień)
  final Widget Function(Widget child, TCategory category, bool isHovering)?
  categoryContainerBuilder;

  // === DEKORACJE ===

  /// Funkcja zwracająca dekorację dla elementu podczas hover (gdy przeciągany element jest nad nim)
  final BoxDecoration? Function(bool isHovering) itemHoverDecorationBuilder;

  /// Funkcja zwracająca dekorację dla kategorii podczas hover (gdy przeciągana kategoria jest nad nią)
  final BoxDecoration? Function(bool isHovering) categoryHoverDecorationBuilder;

  @override
  State<NestedDragDropBoard<TCategory, TItem, TSubItem>> createState() =>
      _NestedDragDropBoardState<TCategory, TItem, TSubItem>();
}

class _NestedDragDropBoardState<TCategory, TItem, TSubItem>
    extends State<NestedDragDropBoard<TCategory, TItem, TSubItem>> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(widget.categories.length, (categoryIndex) {
          final category = widget.categories[categoryIndex];
          final items = widget.getItemsFromCategory(category);
          final categoryKey = widget.getCategoryKey(category);

          return AnimatedSize(
            key: ValueKey('category_$categoryKey'),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: DragTarget<_DragData<TCategory>>(
              onWillAcceptWithDetails: (details) {
                // Akceptuj kategorię która jest przeciągana
                return details.data.type == _DragType.category &&
                    details.data.categoryIndex != categoryIndex;
              },
              onAcceptWithDetails: (details) {
                if (details.data.type == _DragType.category) {
                  final oldIndex = details.data.categoryIndex!;
                  var newIndex = categoryIndex;

                  // Adjustuj indeks
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  widget.onCategoryReorder?.call(oldIndex, newIndex);
                }
              },
              builder: (context, candidateData, rejectedData) {
                final isHovering = candidateData.isNotEmpty;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: widget.categoryHoverDecorationBuilder.call(
                    isHovering,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Kategoria
                      Draggable<_DragData<TCategory>>(
                        data: _DragData<TCategory>(
                          type: _DragType.category,
                          item: category,
                          categoryIndex: categoryIndex,
                        ),
                        feedback:
                            widget.categoryDragFeedback?.call(category) ??
                            Material(
                              child: widget.categoryBuilder(
                                category,
                                categoryIndex,
                              ),
                            ),
                        childWhenDragging: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: 0.3,
                          child: _CategorySection<TCategory, TItem, TSubItem>(
                            key: ValueKey(widget.getCategoryKey(category)),
                            category: category,
                            categoryIndex: categoryIndex,
                            items: items,
                            categoryBuilder: widget.categoryBuilder,
                            itemBuilder: widget.itemBuilder,
                            subItemBuilder: widget.subItemBuilder,
                            getSubItemsFromItem: widget.getSubItemsFromItem,
                            getItemKey: widget.getItemKey,
                            getSubItemKey: widget.getSubItemKey,
                            itemDragFeedback: widget.itemDragFeedback,
                            subItemDragFeedback: widget.subItemDragFeedback,
                            itemDropPlaceholder: widget.itemDropPlaceholder,
                            subItemDropPlaceholder:
                                widget.subItemDropPlaceholder,
                            emptySubItemDropPlaceholder:
                                widget.emptySubItemDropPlaceholder,
                            categoryContainerBuilder:
                                widget.categoryContainerBuilder,
                            itemHoverDecorationBuilder:
                                widget.itemHoverDecorationBuilder,
                            onItemMove: widget.onItemMove,
                            onSubItemMove: widget.onSubItemMove,
                            onItemToSubItem: widget.onItemToSubItem,
                            onSubItemToItem: widget.onSubItemToItem,
                          ),
                        ),
                        child: _CategorySection<TCategory, TItem, TSubItem>(
                          key: ValueKey(widget.getCategoryKey(category)),
                          category: category,
                          categoryIndex: categoryIndex,
                          items: items,
                          categoryBuilder: widget.categoryBuilder,
                          itemBuilder: widget.itemBuilder,
                          subItemBuilder: widget.subItemBuilder,
                          getSubItemsFromItem: widget.getSubItemsFromItem,
                          getItemKey: widget.getItemKey,
                          getSubItemKey: widget.getSubItemKey,
                          itemDragFeedback: widget.itemDragFeedback,
                          subItemDragFeedback: widget.subItemDragFeedback,
                          itemDropPlaceholder: widget.itemDropPlaceholder,
                          subItemDropPlaceholder: widget.subItemDropPlaceholder,
                          emptySubItemDropPlaceholder:
                              widget.emptySubItemDropPlaceholder,
                          categoryContainerBuilder:
                              widget.categoryContainerBuilder,
                          itemHoverDecorationBuilder:
                              widget.itemHoverDecorationBuilder,
                          categoryHoverDecorationBuilder:
                              widget.categoryHoverDecorationBuilder,
                          onItemMove: widget.onItemMove,
                          onSubItemMove: widget.onSubItemMove,
                          onItemToSubItem: widget.onItemToSubItem,
                          onSubItemToItem: widget.onSubItemToItem,
                        ),
                      ),

                      // Drop target PO kategorii
                      DragTarget<_DragData<TCategory>>(
                        onWillAcceptWithDetails: (details) {
                          // Akceptuj tylko jeśli to inna kategoria
                          return details.data.type == _DragType.category &&
                              details.data.categoryIndex != categoryIndex &&
                              details.data.categoryIndex != categoryIndex + 1;
                        },
                        onAcceptWithDetails: (details) {
                          if (details.data.type == _DragType.category) {
                            final oldIndex = details.data.categoryIndex!;
                            // Wstaw PO tej kategorii (categoryIndex + 1)
                            var newIndex = categoryIndex + 1;

                            // Jeśli przeciągamy w dół, adjustuj
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }

                            widget.onCategoryReorder?.call(oldIndex, newIndex);
                          }
                        },
                        builder: (context, candidateData, rejectedData) {
                          final isHovering = candidateData.isNotEmpty;

                          // Zawsze używaj podanego placeholder'a
                          return widget.categoryDropPlaceholder(isHovering);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}

class _CategorySection<TCategory, TItem, TSubItem> extends StatelessWidget {
  const _CategorySection({
    required this.category,
    required this.categoryIndex,
    required this.items,
    required this.categoryBuilder,
    required this.itemBuilder,
    required this.subItemBuilder,
    required this.getSubItemsFromItem,
    required this.getItemKey,
    required this.getSubItemKey,
    required this.onItemMove,
    required this.onSubItemMove,
    required this.onItemToSubItem,
    required this.onSubItemToItem,
    this.itemDragFeedback,
    this.subItemDragFeedback,
    required this.itemDropPlaceholder,
    required this.subItemDropPlaceholder,
    required this.emptySubItemDropPlaceholder,
    this.categoryContainerBuilder,
    this.itemHoverDecorationBuilder,
    this.categoryHoverDecorationBuilder,
    super.key,
  });

  final TCategory category;
  final int categoryIndex;
  final List<TItem> items;
  final Widget Function(TCategory category, int index) categoryBuilder;
  final Widget Function(TItem item, int categoryIndex, int itemIndex)
  itemBuilder;
  final Widget Function(TSubItem subItem, int itemIndex, int subItemIndex)
  subItemBuilder;
  final List<TSubItem> Function(TItem item) getSubItemsFromItem;
  final String Function(TItem item) getItemKey;
  final String Function(TSubItem subItem) getSubItemKey;
  final void Function(
    TItem item,
    int fromCategoryIndex,
    int toCategoryIndex,
    int toItemIndex,
  )?
  onItemMove;
  final void Function(
    TSubItem subItem,
    int fromCategoryIndex,
    int fromItemIndex,
    int toCategoryIndex,
    int toItemIndex,
    int toSubItemIndex,
  )?
  onSubItemMove;
  final void Function(
    TItem item,
    int fromCategoryIndex,
    int toCategoryIndex,
    int toItemIndex,
  )?
  onItemToSubItem;
  final void Function(
    TSubItem subItem,
    int fromCategoryIndex,
    int fromItemIndex,
    int toCategoryIndex,
    int toItemIndex,
  )?
  onSubItemToItem;
  final Widget Function(TItem item)? itemDragFeedback;
  final Widget Function(TSubItem subItem)? subItemDragFeedback;
  final Widget Function(bool isHovering) itemDropPlaceholder;
  final Widget Function(bool isHovering) subItemDropPlaceholder;
  final Widget Function(bool isHovering) emptySubItemDropPlaceholder;
  final Widget Function(Widget child, TCategory category, bool isHovering)?
  categoryContainerBuilder;
  final BoxDecoration? Function(bool isHovering)? itemHoverDecorationBuilder;
  final BoxDecoration? Function(bool isHovering)?
  categoryHoverDecorationBuilder;

  @override
  Widget build(BuildContext context) {
    final categoryContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Category header
        categoryBuilder(category, categoryIndex),

        // Items list
        ...items.asMap().entries.map((entry) {
          final itemIndex = entry.key;
          final item = entry.value;
          final subItems = getSubItemsFromItem(item);
          final itemKey = getItemKey(item);

          return AnimatedSize(
            key: ValueKey('item_$itemKey'),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drop target BEFORE this item (accepts both items and sub-items)
                DragTarget<_DragData<dynamic>>(
                  onWillAcceptWithDetails: (details) {
                    if (details.data.type == _DragType.item) {
                      return !(details.data.categoryIndex == categoryIndex &&
                          details.data.itemIndex == itemIndex);
                    } else if (details.data.type == _DragType.subItem) {
                      return true; // Accept sub-items to convert to main items
                    }
                    return false;
                  },
                  onAcceptWithDetails: (details) {
                    if (details.data.type == _DragType.item) {
                      final draggedItem = details.data.item;
                      var adjustedIndex = itemIndex;

                      // If dragging within same category and from earlier position, don't adjust
                      if (details.data.categoryIndex == categoryIndex &&
                          details.data.itemIndex! < itemIndex) {
                        adjustedIndex = itemIndex - 1;
                      }

                      onItemMove?.call(
                        draggedItem,
                        details.data.categoryIndex!,
                        categoryIndex,
                        adjustedIndex,
                      );
                    } else if (details.data.type == _DragType.subItem) {
                      // Convert sub-item to main item
                      final draggedSubItem = details.data.item;

                      onSubItemToItem?.call(
                        draggedSubItem,
                        details.data.categoryIndex!,
                        details.data.itemIndex!,
                        categoryIndex,
                        itemIndex,
                      );
                    }
                  },
                  builder: (context, candidateData, rejectedData) {
                    final isHovering = candidateData.isNotEmpty;

                    return itemDropPlaceholder(isHovering);
                  },
                ),

                // Main item with drag and drop target ON it (for converting to sub-item)
                Draggable<_DragData<TItem>>(
                  data: _DragData<TItem>(
                    type: _DragType.item,
                    item: item,
                    categoryIndex: categoryIndex,
                    itemIndex: itemIndex,
                  ),
                  feedback:
                      itemDragFeedback?.call(item) ??
                      Material(
                        child: itemBuilder(item, categoryIndex, itemIndex),
                      ),
                  childWhenDragging: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: 0.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        itemBuilder(item, categoryIndex, itemIndex),
                        ...subItems.asMap().entries.map((subEntry) {
                          return subItemBuilder(
                            subEntry.value,
                            itemIndex,
                            subEntry.key,
                          );
                        }),
                      ],
                    ),
                  ),
                  child: DragTarget<_DragData<dynamic>>(
                    // Accept item dropped ON this item (convert to sub-item)
                    onWillAcceptWithDetails: (details) {
                      if (details.data.type == _DragType.item) {
                        if (details.data.categoryIndex == categoryIndex &&
                            details.data.itemIndex == itemIndex) {
                          return false;
                        }

                        // Block if dragged item has sub-items (prevent nested hierarchy)
                        final draggedItem = details.data.item;
                        return getSubItemsFromItem(draggedItem).isEmpty;
                      } else if (details.data.type == _DragType.subItem) {
                        return true; // Accept sub-items to add as sub-items to this item
                      }
                      return false;
                    },
                    onAcceptWithDetails: (details) {
                      if (details.data.type == _DragType.item) {
                        final draggedItem = details.data.item;
                        // Call onItemToSubItem when item is dropped ON another item
                        onItemToSubItem?.call(
                          draggedItem,
                          details.data.categoryIndex!,
                          categoryIndex,
                          itemIndex, // this item becomes parent
                        );
                      } else if (details.data.type == _DragType.subItem) {
                        final draggedSubItem = details.data.item as TSubItem;
                        // Call onSubItemMove when sub-item is dropped ON this item
                        onSubItemMove?.call(
                          draggedSubItem,
                          details.data.categoryIndex!,
                          details.data.itemIndex!,
                          categoryIndex,
                          itemIndex,
                          0, // add as first sub-item
                        );
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      final isHoveringOnItem = candidateData.isNotEmpty;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: itemHoverDecorationBuilder?.call(
                          isHoveringOnItem,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            itemBuilder(item, categoryIndex, itemIndex),

                            // Drop zone for empty sub-items (when item has no sub-items)
                            if (subItems.isEmpty)
                              DragTarget<_DragData<TSubItem>>(
                                onWillAcceptWithDetails: (details) {
                                  return details.data.type == _DragType.subItem;
                                },
                                onAcceptWithDetails: (details) {
                                  if (details.data.type == _DragType.subItem) {
                                    final draggedSubItem = details.data.item;

                                    onSubItemMove?.call(
                                      draggedSubItem,
                                      details.data.categoryIndex!,
                                      details.data.itemIndex!,
                                      categoryIndex,
                                      itemIndex,
                                      0, // first sub-item
                                    );
                                  }
                                },
                                builder:
                                    (context, candidateData, rejectedData) {
                                      final isHovering =
                                          candidateData.isNotEmpty;

                                      return emptySubItemDropPlaceholder(
                                        isHovering,
                                      );
                                    },
                              ),

                            // Sub-items
                            ...subItems.asMap().entries.map((subEntry) {
                              final subItemIndex = subEntry.key;
                              final subItem = subEntry.value;
                              final subItemKey = getSubItemKey(subItem);

                              return AnimatedSize(
                                key: ValueKey('subitem_$subItemKey'),
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Drop target BEFORE sub-item
                                    DragTarget<_DragData<TSubItem>>(
                                      onWillAcceptWithDetails: (details) {
                                        return details.data.type ==
                                                _DragType.subItem &&
                                            !(details.data.categoryIndex ==
                                                    categoryIndex &&
                                                details.data.itemIndex ==
                                                    itemIndex &&
                                                details.data.subItemIndex ==
                                                    subItemIndex);
                                      },
                                      onAcceptWithDetails: (details) {
                                        if (details.data.type ==
                                            _DragType.subItem) {
                                          final draggedSubItem =
                                              details.data.item;

                                          onSubItemMove?.call(
                                            draggedSubItem,
                                            details.data.categoryIndex!,
                                            details.data.itemIndex!,
                                            categoryIndex,
                                            itemIndex,
                                            subItemIndex, // drop before this sub-item
                                          );
                                        }
                                      },
                                      builder:
                                          (
                                            context,
                                            candidateData,
                                            rejectedData,
                                          ) {
                                            final isHovering =
                                                candidateData.isNotEmpty;

                                            return subItemDropPlaceholder(
                                              isHovering,
                                            );
                                          },
                                    ),

                                    // Sub-item draggable
                                    Draggable<_DragData<TSubItem>>(
                                      data: _DragData<TSubItem>(
                                        type: _DragType.subItem,
                                        item: subItem,
                                        categoryIndex: categoryIndex,
                                        itemIndex: itemIndex,
                                        subItemIndex: subItemIndex,
                                      ),
                                      feedback:
                                          subItemDragFeedback?.call(subItem) ??
                                          Material(
                                            child: subItemBuilder(
                                              subItem,
                                              itemIndex,
                                              subItemIndex,
                                            ),
                                          ),
                                      childWhenDragging: AnimatedOpacity(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        opacity: 0.3,
                                        child: subItemBuilder(
                                          subItem,
                                          itemIndex,
                                          subItemIndex,
                                        ),
                                      ),
                                      child: subItemBuilder(
                                        subItem,
                                        itemIndex,
                                        subItemIndex,
                                      ),
                                    ),

                                    // Drop target AFTER sub-item (only for last sub-item)
                                    if (subItemIndex == subItems.length - 1)
                                      DragTarget<_DragData<TSubItem>>(
                                        onWillAcceptWithDetails: (details) {
                                          return details.data.type ==
                                              _DragType.subItem;
                                        },
                                        onAcceptWithDetails: (details) {
                                          if (details.data.type ==
                                              _DragType.subItem) {
                                            final draggedSubItem =
                                                details.data.item;

                                            onSubItemMove?.call(
                                              draggedSubItem,
                                              details.data.categoryIndex!,
                                              details.data.itemIndex!,
                                              categoryIndex,
                                              itemIndex,
                                              subItemIndex + 1,
                                            );
                                          }
                                        },
                                        builder:
                                            (
                                              context,
                                              candidateData,
                                              rejectedData,
                                            ) {
                                              final isHovering =
                                                  candidateData.isNotEmpty;

                                              return subItemDropPlaceholder(
                                                isHovering,
                                              );
                                            },
                                      ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),

        // Drop zone for empty category
        if (items.isEmpty)
          DragTarget<_DragData<TItem>>(
            onWillAcceptWithDetails: (details) =>
                details.data.type == _DragType.item,
            onAcceptWithDetails: (details) {
              if (details.data.type == _DragType.item) {
                final draggedItem = details.data.item;
                onItemMove?.call(
                  draggedItem,
                  details.data.categoryIndex!,
                  categoryIndex,
                  0,
                );
              }
            },
            builder: (context, candidateData, rejectedData) {
              final isHovering = candidateData.isNotEmpty;

              return itemDropPlaceholder(isHovering);
            },
          ),

        // Drop zone for sub-items at the end of items list (always visible)
        DragTarget<_DragData<TSubItem>>(
          onWillAcceptWithDetails: (details) =>
              details.data.type == _DragType.subItem,
          onAcceptWithDetails: (details) {
            if (details.data.type == _DragType.subItem) {
              final draggedSubItem = details.data.item;
              onSubItemToItem?.call(
                draggedSubItem,
                details.data.categoryIndex!,
                details.data.itemIndex!,
                categoryIndex,
                items.length, // append at the end
              );
            }
          },
          builder: (context, candidateData, rejectedData) {
            final isHovering = candidateData.isNotEmpty;

            return itemDropPlaceholder(isHovering);
          },
        ),
      ],
    );

    // Wrap in custom container if provided
    if (categoryContainerBuilder != null) {
      return categoryContainerBuilder!(categoryContent, category, false);
    }

    return categoryContent;
  }
}

enum _DragType { category, item, subItem }

class _DragData<T> {
  const _DragData({
    required this.type,
    required this.item,
    this.categoryIndex,
    this.itemIndex,
    this.subItemIndex,
  });

  final _DragType type;
  final T item;
  final int? categoryIndex;
  final int? itemIndex;
  final int? subItemIndex;
}

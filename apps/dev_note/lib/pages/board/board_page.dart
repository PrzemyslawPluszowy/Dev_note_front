import 'package:auto_route/auto_route.dart';
import 'package:dev_note/core/gen/locale_keys.g.dart';
import 'package:dev_note/pages/navigations/view/components/rail_menu/notifier/active_board_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    // Set active board after build is complete to avoid "setState during build" error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveBoardNotifier.instance.setActiveBoard(widget.boardId);
    });
  }

  @override
  void didUpdateWidget(BoardPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update active board if boardId changes
    if (oldWidget.boardId != widget.boardId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ActiveBoardNotifier.instance.setActiveBoard(widget.boardId);
      });
    }
  }

  @override
  void dispose() {
    // Optional: Clear active board when leaving
    // ActiveBoardNotifier.instance.setActiveBoard(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('BoardPage.build for id=${widget.boardId}');

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.labels_boards.tr(), style: context.textTheme.headlineSmall),
          const SizedBox(height: Sizes.p8),
          Text('Board id: ${widget.boardId}', style: context.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

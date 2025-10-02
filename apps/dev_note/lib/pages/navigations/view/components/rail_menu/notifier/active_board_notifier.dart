import 'package:flutter/foundation.dart';

/// Notifier that tracks the currently active board ID
/// Used to efficiently update board selection state without rebuilding entire widget tree
/// This is a singleton to be used globally across the app
class ActiveBoardNotifier extends ChangeNotifier {
  ActiveBoardNotifier._();

  static final ActiveBoardNotifier instance = ActiveBoardNotifier._();

  String? _activeBoardId;

  String? get activeBoardId => _activeBoardId;

  void setActiveBoard(String? boardId) {
    if (_activeBoardId != boardId) {
      _activeBoardId = boardId;
      notifyListeners();
    }
  }

  bool isBoardActive(String boardId) {
    return _activeBoardId == boardId;
  }
}

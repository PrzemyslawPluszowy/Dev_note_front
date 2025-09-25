// phosphor_flutter

// Enum representing popular Phosphor icons
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart' as phosphor;

enum ApiPhosphorIcons {
  arrowUp,
  arrowDown,
  arrowLeft,
  arrowRight,
  check,
  x,
  plus,
  minus,
  heart,
  star,
  bell,
  clock,
  calendar,
  camera,
  chat,
  cloud,
  download,
  upload,
  eye,
  eyeSlash,
  file,
  folder,
  gear,
  globe,
  home,
  info,
  lock,
  unlock,
  magnifyingGlass,
  musicNote,
  pencil,
  phone,
  shoppingCart,
  trash,
  user,
  videoCamera,
  wifi,
  wrench;

  IconData get icon {
    switch (this) {
      case ApiPhosphorIcons.arrowUp:
        return phosphor.PhosphorIcons.arrowUp();
      case ApiPhosphorIcons.arrowDown:
        return phosphor.PhosphorIcons.arrowDown();
      case ApiPhosphorIcons.arrowLeft:
        return phosphor.PhosphorIcons.arrowLeft();
      case ApiPhosphorIcons.arrowRight:
        return phosphor.PhosphorIcons.arrowRight();
      case ApiPhosphorIcons.check:
        return phosphor.PhosphorIcons.check();
      case ApiPhosphorIcons.x:
        return phosphor.PhosphorIcons.x();
      case ApiPhosphorIcons.plus:
        return phosphor.PhosphorIcons.plus();
      case ApiPhosphorIcons.minus:
        return phosphor.PhosphorIcons.minus();
      case ApiPhosphorIcons.heart:
        return phosphor.PhosphorIcons.heart();
      case ApiPhosphorIcons.star:
        return phosphor.PhosphorIcons.star();
      case ApiPhosphorIcons.bell:
        return phosphor.PhosphorIcons.bell();
      case ApiPhosphorIcons.clock:
        return phosphor.PhosphorIcons.clock();
      case ApiPhosphorIcons.calendar:
        return phosphor.PhosphorIcons.calendar();
      case ApiPhosphorIcons.camera:
        return phosphor.PhosphorIcons.camera();
      case ApiPhosphorIcons.chat:
        return phosphor.PhosphorIcons.chat();
      case ApiPhosphorIcons.cloud:
        return phosphor.PhosphorIcons.cloud();
      case ApiPhosphorIcons.download:
        return phosphor.PhosphorIcons.download();
      case ApiPhosphorIcons.upload:
        return phosphor.PhosphorIcons.upload();
      case ApiPhosphorIcons.eye:
        return phosphor.PhosphorIcons.eye();
      case ApiPhosphorIcons.eyeSlash:
        return phosphor.PhosphorIcons.eyeSlash();
      case ApiPhosphorIcons.file:
        return phosphor.PhosphorIcons.file();
      case ApiPhosphorIcons.folder:
        return phosphor.PhosphorIcons.folder();
      case ApiPhosphorIcons.gear:
        return phosphor.PhosphorIcons.gear();
      case ApiPhosphorIcons.globe:
        return phosphor.PhosphorIcons.globe();
      case ApiPhosphorIcons.home:
        return phosphor.PhosphorIcons.house();
      case ApiPhosphorIcons.info:
        return phosphor.PhosphorIcons.info();
      case ApiPhosphorIcons.lock:
        return phosphor.PhosphorIcons.lock();
      case ApiPhosphorIcons.unlock:
        return phosphor.PhosphorIcons.lockOpen();
      case ApiPhosphorIcons.magnifyingGlass:
        return phosphor.PhosphorIcons.magnifyingGlass();
      case ApiPhosphorIcons.musicNote:
        return phosphor.PhosphorIcons.musicNote();
      case ApiPhosphorIcons.pencil:
        return phosphor.PhosphorIcons.pencil();
      case ApiPhosphorIcons.phone:
        return phosphor.PhosphorIcons.phone();
      case ApiPhosphorIcons.shoppingCart:
        return phosphor.PhosphorIcons.shoppingCart();
      case ApiPhosphorIcons.trash:
        return phosphor.PhosphorIcons.trash();
      case ApiPhosphorIcons.user:
        return phosphor.PhosphorIcons.user();
      case ApiPhosphorIcons.videoCamera:
        return phosphor.PhosphorIcons.videoCamera();
      case ApiPhosphorIcons.wifi:
        return phosphor.PhosphorIcons.wifiHigh();
      case ApiPhosphorIcons.wrench:
        return phosphor.PhosphorIcons.wrench();
    }
  }

  List<IconData> get allIcons =>
      ApiPhosphorIcons.values.map((e) => e.icon).toList();
}

class PhosphorIconsSerializer
    implements JsonConverter<ApiPhosphorIcons, String?> {
  const PhosphorIconsSerializer();

  @override
  ApiPhosphorIcons fromJson(String? json) {
    if (json == null || json.isEmpty) return ApiPhosphorIcons.folder;
    return ApiPhosphorIcons.values.firstWhere(
      (e) => e.name == json,
      orElse: () => ApiPhosphorIcons.folder,
    );
  }

  @override
  String? toJson(ApiPhosphorIcons? object) {
    return object?.name;
  }
}

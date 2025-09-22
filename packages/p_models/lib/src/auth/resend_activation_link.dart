import 'package:json_annotation/json_annotation.dart';

part 'resend_activation_link.g.dart';

@JsonSerializable()
class ResendActivationLink {
  final String email;
  ResendActivationLink({required this.email});

  factory ResendActivationLink.fromJson(Map<String, dynamic> json) =>
      _$ResendActivationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ResendActivationLinkToJson(this);
}

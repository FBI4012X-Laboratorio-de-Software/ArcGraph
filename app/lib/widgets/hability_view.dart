import 'package:ArcGraph/models/evaluations/hability.dart';

class HabilityView {
  final Hability hability;
  bool isExpanded;

  HabilityView(this.hability, this.isExpanded);

  int average() => (this.hability.average() * 10).floor();
}

import 'package:qoute_2/models/qoutesWidget.dart';

class Qoute {
  String name;
  String qoute;
  bool liked;
  Qoute(this.name, this.qoute, this.liked);
  @override
  String toString() {
    return super.toString();
  }
}

List<Qoute> general =
    generalQoutes.map((item) => Qoute(item['name'], item['q'], false)).toList();

List<Qoute> funnyQoutes =
    funny.map((item) => Qoute(item['name'], item['q'], false)).toList();

List<Qoute> love =
    vaultLove.map((e) => Qoute(e['name'], e['q'], false)).toList();

List<Qoute> pickLines =
    pickup.map((e) => Qoute(e['name'], e['q'], false)).toList();

List<Qoute> loveQoute =
    loveQoutes.map((e) => Qoute(e['name'], e['q'], false)).toList();

List<Qoute> forgive =
    forgiveme.map((e) => Qoute(e['name'], e['q'], false)).toList();

List<Qoute> heartBreak =
    hurt.map((e) => Qoute(e['name'], e['q'], false)).toList();

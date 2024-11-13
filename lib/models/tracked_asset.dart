class TrackedAsset {
  String? name;
  double? amount;
  String? symbol;

  TrackedAsset({
    required this.name,
    required this.amount,
    required this.symbol,
  });

  TrackedAsset.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    data['symbol'] = symbol;
    return data;
  }
}

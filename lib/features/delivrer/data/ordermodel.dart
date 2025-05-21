class order {
  final String resto;
  final String client;
  final String clientloc;
  final String restoloc;
  final int clientnumber;
  final int restonumber;
  final int total;
  final String clientimg;
  final String restoimg;

  order({
    required this.clientimg,
    required this.restoimg,
    required this.resto,
    required this.client,
    required this.clientloc,
    required this.clientnumber,
    required this.restoloc,
    required this.restonumber,
    required this.total,
  });

  factory order.fromJson(Map<String, dynamic> json) {
    return order(
      clientimg: json['clientimg'] as String,
      restoimg: json['restoimg'] as String,
      resto: json['resto'] as String,
      client: json['client'] as String,
      clientloc: json['clientloc'] as String,
      clientnumber: json['clientnumber'] as int,
      restoloc: json['restoloc'] as String,
      restonumber: json['restonumber'] as int,
      total: json['total'] as int,
    );
  }
}

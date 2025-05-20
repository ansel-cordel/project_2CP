class order {
  String resto;
  String client;
  String clientloc;
  String restoloc;
  int clientnumber;
  int restonumber;
  int total;
  String clientimg;
  String restoimg;
  order(
      {required this.clientimg,
      required this.restoimg,
      required this.resto,
      required this.client,
      required this.clientloc,
      required this.clientnumber,
      required this.restoloc,
      required this.restonumber,
      required this.total});
}

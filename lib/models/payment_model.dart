class PaymentModel {
  String invCode;
  int amount;
  String method;

  PaymentModel({required this.invCode, required this.method, required this.amount});
}
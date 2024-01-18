class PaymentModel {
  String invCode;
  int amount;
  String method;
  PaymentModel({required this.invCode, required this.method, required this.amount});
}

class WaitingPaymentData{
  final List<WaitingPaymentModel> dataWaitingPayment;
  WaitingPaymentData({required this.dataWaitingPayment});

  factory WaitingPaymentData.fromJson(Map<String, dynamic> json)=>
      WaitingPaymentData(
        dataWaitingPayment: List.from(
            json["data"].map((waitingPayment) => WaitingPaymentModel.fromJson(waitingPayment))),
      );


}

class WaitingPaymentModel{
  final int id;
  final String date;
  final String pict;
  final String title;

  WaitingPaymentModel({
    required this.id,
    required this.date,
    required this.pict,
    required this.title
  });

  factory WaitingPaymentModel.fromJson(Map<String,dynamic> json){
    return WaitingPaymentModel(
        id: json['id'],
        date: json['created_at'],
        pict: json['pict'],
        title: json['title']
    );
  }

}
class PaymentModel {
  String invCode;
  int amount;
  String method;

  PaymentModel({required this.invCode, required this.method, required this.amount});
  // int id;
  // String createdAt;
  // String updatedAt;
  // String order_id;
  // String transaction_id;
  // int amount;
  // String method;
  // String va_number;
  // String status;
  // int CourseId;
  // String UserId;
  //
  // PaymentModel({
  //   required this.id,
  //   required this.createdAt,
  //   required this.updatedAt,
  //   required this.order_id,
  //   required this.transaction_id,
  //   required this.amount,
  //   required this.method,
  //   required this.va_number,
  //   required this.status,
  //   required this.CourseId,
  //   required this.UserId,
  // });
  //
  // factory PaymentModel.fromJson(Map<String, dynamic>map){
  //   return PaymentModel(
  //       id: map['id'],
  //       createdAt: map['createdAt'],
  //       updatedAt: map['updatedAt'],
  //       order_id: map['order_id'],
  //       transaction_id: map['transaction_id'],
  //       amount: map['amount'],
  //       method: map['method'],
  //       va_number: map['va_number'],
  //       status: map['status'],
  //       CourseId: map['CourseId'],
  //       UserId: map['UserId']
  //   );
  // }
}
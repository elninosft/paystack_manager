import 'package:paystack_manager/models/transaction_status.dart';
import 'api_response.dart';

class Transaction {
  String message;
  String refrenceNumber;
  String auth;
  TransactionState state;

  Transaction({
    this.message,
    this.refrenceNumber,
    this.auth,
    this.state,
  });

  factory Transaction.fromObject(APIResponse apiResponse) {
    final transaction = Transaction();
    transaction.message =
        apiResponse.gatewayResponse ?? apiResponse.dataMessage ?? "";
    transaction.refrenceNumber = apiResponse.reference;
    transaction.auth = apiResponse.authCode;
    transaction.state = apiResponse.nextAction;
    return transaction;
  }
}

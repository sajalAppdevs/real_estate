class ApiCallFailedException {
  final String message;

  ApiCallFailedException({this.message = "Api call failed"});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ApiCallFailedException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => super.hashCode ^ message.hashCode;
}

class InsufficientWalletFundException {
  final String message;

  InsufficientWalletFundException({this.message = "Insufficient Wallet"});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InsufficientWalletFundException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class TransactionLimitExceededException {
  final String message;

  TransactionLimitExceededException(
      {this.message = "Transaction limit exceeded"});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionLimitExceededException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

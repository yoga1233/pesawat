import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pesawat/models/transaction_model.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add(
        {
          'destination': transaction.destination.toJson(),
          'amountOfTraveler': transaction.amountOfTraveler,
          'selectedSeat': transaction.selectedSeat,
          'insurance': transaction.insurance,
          'refundable': transaction.refundable,
          'vat': transaction.vat,
          'price': transaction.price,
          'grandTotal': transaction.grandTotal,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchtransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      rethrow;
    }
  }
}

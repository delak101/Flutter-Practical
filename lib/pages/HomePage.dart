import 'package:flutter/material.dart';
import 'MyTransactions.dart';
import 'PlusButton.dart';
import 'TopNueCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> transactions = [];
  double income = 0;
  double expense = 0;

  // Method to add transactions
  void _enterTransaction(String type, String amount, String item) {
    setState(() {
      transactions.add({
        'type': type,
        'amount': amount,
        'item': item,
      });
      

      // Update income or expense based on the type of transaction
      if (type == 'Income') {
        income += double.parse(amount);
      } else {
        expense += double.parse(amount);
      }
    });
  }

  // Method to show the dialog for new transaction
  void _newTransaction() {
    bool isIncome = true; // Default to Income
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        TextEditingController amountController = TextEditingController();
        TextEditingController itemController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
          return AlertDialog(
              title: Text('New Transaction'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Expense'),
                      Switch(
                        value: isIncome,
                        onChanged: (value) {
                          setState(() {
                            isIncome = value;
                          });
                        },
                      ),
                      Text('Income'),
                    ],
                  ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Amount'),
                  ),
                  TextField(
                    controller: itemController,
                    decoration: InputDecoration(hintText: 'For what?'),
                  ),
                ],
              ),
              actions: <Widget>[
                MaterialButton(
                  color: Colors.grey[600],
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  color: Colors.grey[600],
                  child: Text('Enter', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (amountController.text.isNotEmpty && itemController.text.isNotEmpty) {
                      _enterTransaction(isIncome ? 'Income' : 'Expense', amountController.text, itemController.text);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            // Display balance, income, and expense in the TopNeuCard
            TopNeuCard(
              balance: (income - expense).toString(),
              income: income.toString(),
              expense: expense.toString(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return MyTransaction(
                    transactionName: transactions[index]['item']!,
                    money: transactions[index]['amount']!,
                    expenseOrIncome: transactions[index]['type']!,
                  );
                },
              ),
            ),
            // Button to add a new transaction
            PlusButton(function: _newTransaction),
          ],
        ),
      ),
    );
  }
}


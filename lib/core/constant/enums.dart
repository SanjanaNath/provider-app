enum Roles {
  admin('Admin'),
  premium('Premium'),
  user('User');

  final String value;

  const Roles(this.value);
}

enum Genders {
  male('Male'),
  female('Female'),
  other('Other');

  final String value;

  const Genders(this.value);
}


enum OrderStatuses {
  all('All'),
  placed('Order Placed'),
  processing('Processing'),
  confirmed('Order Confirmed'),
  completed('Completed');

  final String value;

  const OrderStatuses(this.value);
}

enum BankAccountTypes {
  bank('Bank', 'Bank'),
  upi('UPI', 'UPI'),
  phonePe('PhonePe', 'PhonePe'),
  paytm('Paytm', 'Paytm'),
  gPay('Google Pay', 'Google Pay');

  final String id;
  final String value;

  const BankAccountTypes(this.id, this.value);
}



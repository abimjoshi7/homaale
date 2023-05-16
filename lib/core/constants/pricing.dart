const double kBudgetTo = 10;
const double kDefaultCommission = 0.15;
const double kDefaultServiceCharge = 0.02;
const double kDefaultVat = 1.13;

double getCommissionMultiplier(double commission) {
  return 1 - ((commission + kDefaultServiceCharge) * kDefaultVat);
}

// Get payable amount for a given amount by adding commission and service charge
int getPayableAmount(double amount, double commission) {
  return (amount / getCommissionMultiplier(commission)).ceil();
}

// Get receivable amount for a given amount from payable by subtracting commission and service charge
int getRecievableAmount(double amount, double commission) {
  return (amount * getCommissionMultiplier(commission)).ceil();
}

codeunit 50123 LoanCalculations
{
    procedure CalculateLoanRepayments(AmountApplied: Decimal; AmountApproved: Decimal; LoanPeriod: Integer; InterestRate: Integer;
        var PrincipalPayment: Decimal; var MonthlyInterest: Decimal; var MonthlyRepayment: Decimal; var TotalLoanBalance: Decimal)
    begin
        if


         (AmountApproved > 0) and (LoanPeriod > 0) then begin
            PrincipalPayment := AmountApproved / LoanPeriod;
            MonthlyInterest := (InterestRate * AmountApproved / 1200);
            MonthlyRepayment := PrincipalPayment + MonthlyInterest;
            TotalLoanBalance := MonthlyRepayment * LoanPeriod;
        end;
    end;
}

codeunit 50111 LoanChargesMgmt
{
    procedure GenerateLoanCharges(LoanNumber: Code[50])
    var
        Charges: Record "Loan Charges1";
        ChargeLine: Record "Loan Charges Lines";
        LoanRec: Record Loans1;
        MaxNo: Integer;
    begin
        if not LoanRec.Get(LoanNumber) then
            Error('Loan record with number %1 not found.', LoanNumber);

        Charges.Reset();
        if Charges.FindSet() then begin
            repeat
                // Check for existing charge line (Loan Number + Charge Code)
                ChargeLine.Reset();
                ChargeLine.SetRange("Loan Number", LoanNumber);
                ChargeLine.SetRange("Charge Code", Charges."Charge Code");

                if not ChargeLine.FindFirst() then begin
                    ChargeLine.Init();

                    // Get Max Number to avoid duplicate key error
                    ChargeLine.Reset();
                    if ChargeLine.FindLast() then
                        MaxNo := ChargeLine.Number
                    else
                        MaxNo := 0;

                    ChargeLine.Number := MaxNo + 1;
                    ChargeLine."Loan Number" := LoanNumber;
                    ChargeLine."Charge Code" := Charges."Charge Code";

                    if Charges."Withdrawal Calculation" = Charges."Withdrawal Calculation"::Percentage then
                        ChargeLine."Charge Amount" := (Charges."Percentage" / 100) * LoanRec."Amount Approved"
                    else
                        ChargeLine."Charge Amount" := Charges.Amount;

                    ChargeLine.Insert();
                end;
            until Charges.Next() = 0;
        end;
    end;
}

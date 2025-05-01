table 50101 "Guarantorship"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                "No." := NoSeriesMgt.GetNextNo('G', WorkDate, true);

            end;


        }

        field(2; "Loan Number"; Code[50])
        {
            TableRelation = "Loans1"."Loan Number";
            DataClassification = ToBeClassified;
        }

        field(3; "Guarantor Account"; Code[20])
        {
            TableRelation = "Savings"."Account Number";
            DataClassification = ToBeClassified;
        }

        field(4; "Member Number"; Code[50])
        {
            TableRelation = "Members1"."Member Number";
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                MemberRec: Record Members1;
                SavingsRec: Record Savings;
            begin
                if Rec."Member Number" <> '' then begin
                    if MemberRec.Get(Rec."Member Number") then
                        Rec."Guarantor Name" := MemberRec.Name
                    else
                        Clear(Rec."Guarantor Name");

                    // Filter for member's DC account
                    SavingsRec.SetRange("Member Number", Rec."Member Number");
                    SavingsRec.SetRange("Product Code", 'DC'); // Make sure 'DC' is the correct code
                    if SavingsRec.FindFirst() then begin
                        Rec."Guarantor Account" := SavingsRec."Account Number";
                        Rec."Current Committed" := SavingsRec.Balance; // Update balance field
                    end else begin
                        Clear(Rec."Guarantor Account");
                        Clear(Rec."Current Committed");
                    end;
                end else begin
                    Clear(Rec."Guarantor Name");
                    Clear(Rec."Guarantor Account");
                    Clear(Rec."Current Committed");
                end;
            end;
        }

        field(5; "Guarantor Name"; Text[100]) { DataClassification = ToBeClassified; }

        field(6; "Amount Guaranteed"; Decimal) { DataClassification = ToBeClassified; }


        field(7; "Guarantorship Percentage"; Decimal) { DataClassification = ToBeClassified; }

        field(8; "Current Committed"; Decimal) { DataClassification = ToBeClassified; }

        field(9; "Guaranteed Member No."; Code[50])
        {
            //TableRelation = "Members1"."Member Number"; 
            DataClassification = ToBeClassified;
        }

        field(10; "Guaranteed Member Name"; Code[50]) { DataClassification = ToBeClassified; }

        field(11; "Loan Balance"; Decimal) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(Key1; "No.") { Clustered = true; }
    }

    var
        myInt: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
    //MemberRec: Record Members1;

    trigger OnInsert()
    var
        LoanRec: Record Loans1;
    begin
        if "No." = '' then
            "No." := NoSeriesMgt.GetNextNo('G', WorkDate, true);
        // Retrieve Loan Data from Parent Loan Card
        if Rec."Loan Number" = '' then begin
            if LoanRec.Get(GetFilter("Loan Number")) then begin
                "Loan Number" := LoanRec."Loan Number";
                "Guaranteed Member No." := LoanRec."Member Number";
                "Guaranteed Member Name" := LoanRec."Name";
            end else begin
                Message('Error: No active Loan Number found.');
                exit;
            end;
        end;

        // Assign Guarantorship Number

    end;




    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}

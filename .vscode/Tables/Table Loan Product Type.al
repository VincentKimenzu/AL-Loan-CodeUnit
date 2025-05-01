table 50130 "Loan Product Type"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Loan Product Code"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Interest Rate"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Minimum Installment"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Maximum Installment"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Minimum Loan"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Maximum Loan"; Decimal)
        {
            DataClassification = TobeClassified;
        }
        field(8; "Principal G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(9; "Interest Receivable"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Interest Income G/L"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(11; "Penalty Receivables"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Penalty Income"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Loan Product Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        "Loan Product Code" := "NoSeriesMgmt".GetNextNo('LOANTYPE', WorkDate, true);

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

    var
        NoSeriesMgmt: Codeunit "NoSeriesManagement";

        LoanProductType: Record "Loan Product Type";

}
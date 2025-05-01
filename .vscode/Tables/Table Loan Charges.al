table 50132 "Loan Charges1"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Charge Code"; Code[50])
        {

            DataClassification = ToBeClassified;

        }
        field(2; "Withdrawal Calculation"; Enum "Withdrawal Calculation")
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "G/L Account"; Code[50])
        {
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Charge Code")
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
        NoSeriesMgmt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        "Charge Code" := NoSeriesMgmt.GetNextNo('CC', WorkDate, true);

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
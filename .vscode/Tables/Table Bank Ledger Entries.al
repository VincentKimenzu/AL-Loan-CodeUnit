table 50111 "Bank Ledger Entries"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry Number"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Bank Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Type"; Enum "Bank Ledger Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Member Number"; Code[20])
        {
            TableRelation = Members1."Member Number";
            DataClassification = ToBeClassified;
        }
        field(10; "Loan Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry Number")
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
        "User ID" := UserId;

        "Entry Number" := NoSeriesMgmt.GetNextNo('BLE', WorkDate, true);

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
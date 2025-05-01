table 50121 "Bank Accounts"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Bank Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(2; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "GL"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Telephone"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Branch"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Bank Number")
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
table 50118 "Bank Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Branch Code"; Code[3])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Bank Code"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Branch Code")
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
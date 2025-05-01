table 50144 "Products"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Product Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Product Code';
        }
        field(2; "Product Description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Product Description';
        }
        field(3; "Product GL"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            Caption = 'Product GL';
        }
        field(4; "Products Withdrawal"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Product Withdrawal';
        }

    }

    keys
    {
        key(Key1; "Product Code")
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
table 50112 "Loan Charges Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Number; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            //TableRelation = "Loan Charges Lines".Number;

        }
        field(2; "Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Loan Charges1".Description where("Charge Code" = FIELD("Charge Code")));
        }
        field(3; "Charge Amount"; Decimal)
        {
            Caption = 'Amount';
        }
        field(4; "Loan Number"; Code[50])
        {
            TableRelation = "Loans1"."Loan Number";

            DataClassification = ToBeClassified;
        }
        field(5; "Charge Code"; Code[50])
        {
            TableRelation = "Loan Charges1";
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Number")
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
table 50122 "Savings"
{
    DataClassification = ToBeClassified;
    Caption = 'Savings Table';

    fields
    {
        field(1; "Account Number"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Member Number"; Code[50])
        {

            DataClassification = ToBeClassified;

        }
        field(3; "Member Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Product Code"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Product Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Balance"; Decimal)
        {
            DataClassification = ToBeClassified;

        }

    }
    keys
    {
        key(Key1; "Account Number")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    var
        SavingRec: Record "Savings";
    begin
        // Generate Account Number by concatenating Product Code and Member Number
        // "Account Number" := "Product Code" + ' ' + "Member Number";

        // // Check if an existing record has the same Account Number
        // SavingRec.SetRange("Account Number", "Account Number");
        // if SavingRec.FindFirst() then
        //     Error('An account with this number already exists.');

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
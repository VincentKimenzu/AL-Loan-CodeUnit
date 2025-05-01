table 50131 "Image"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Image Entry"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Image Entry';
            // AutoIncrement = true;
            Editable = false;
        }

        field(2; "Registration Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Number';
        }

        field(3; "Member Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Member Number';
        }

        field(4; "Member Photo"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
            Caption = 'Member Photo';
        }

        field(5; "ID Front"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'ID Front';
            Subtype = Bitmap;
        }

        field(6; "ID Back"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'ID Back';
            Subtype = Bitmap;
        }

        field(7; "Passport"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'Passport';
            Subtype = Bitmap;
        }

        field(8; "Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'Signature';
            Subtype = Bitmap;
        }
    }

    keys
    {
        key(Key1; "Image Entry")
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
        "Image Entry" := NoSeriesMgmt.GetNextNo('IMG', WorkDate, true);

        // Code to execute on insert
    end;

    trigger OnModify()
    begin
        // Code to execute on modify
    end;

    trigger OnDelete()
    begin
        // Code to execute on delete
    end;

    trigger OnRename()
    begin
        // Code to execute on rename
    end;



    var
        NoSeriesMgmt: Codeunit NoSeriesManagement;

}
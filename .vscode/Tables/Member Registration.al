table 50140 "Member Registration1"
{
    DataClassification = ToBeClassified;
    Caption = 'Member Registration';

    fields
    {
        field(1; "Registration Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Number';
        }

        field(2; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'First Name';

            trigger OnValidate()
            begin
                UpdateFullName();
            end;
        }
        field(3; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Name';

            trigger OnValidate()
            begin
                UpdateFullName();
            end;
        }
        field(4; Surname; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Surname';

            trigger OnValidate()
            begin
                UpdateFullName();
            end;
        }
        field(5; Name; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Full Name';
        }

        field(6; "ID No."; Code[8])
        {
            DataClassification = ToBeClassified;
            Caption = 'ID No.';
        }
        field(7; "Phone Number"; Code[13])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone Number';
        }
        field(8; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Of Birth';
        }
        field(9; "KRA PIN"; Code[11])
        {
            DataClassification = ToBeClassified;
            Caption = 'KRA PIN';
        }
        field(10; Status; Enum "Status Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(11; "Marital Status"; Enum "Marital Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Marital Status';
        }
        field(12; "Spouse Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Spouse Name';
        }
        field(13; "Spouse ID No."; Code[8])
        {
            DataClassification = ToBeClassified;
            Caption = 'Spouse ID No.';
        }
        field(14; "Spouse Phone No."; Code[13])
        {
            DataClassification = ToBeClassified;
            Caption = 'Spouse Phone No.';
        }
        field(15; "Captured By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Captured By';
            Editable = false; // Ensures it's not manually changed
        }

        field(16; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Date';
        }

        field(17; Age; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Age';
        }

        field(18; County; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'County';
        }

        field(19; "Sub County"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sub County';
        }

        field(20; Location; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Location';
        }

        field(21; "Sub Location"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sub Location';
        }

        field(22; "Village/Estate"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Village/Estate';
        }

        field(23; "Country/Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country/Region';
        }

        field(24; "Branch Code"; Code[3])
        {
            DataClassification = ToBeClassified;
            Caption = 'Branch Code';
        }

        field(25; "Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Branch Name';
        }

        field(26; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Name';
        }

        field(27; "Account No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Account No.';
        }

        field(28; "Employment Type"; Enum "Employment Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Employment Type';
        }

        field(29; Employer; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employer';
        }

        field(30; "Employment Position"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employment Position';
        }

        field(31; "Employment Location"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Employment Location';
        }
    }

    keys
    {
        key(Key1; "Registration Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Registration Number", Name, "Phone Number", "ID No.")
        {
        }
    }

    trigger OnInsert()
    begin
        "Registration Number" := NoSeriesMgmt.GetNextNo('REG', WorkDate, true);
        "Captured By" := UserId;
        // Automatically assigns the current user
        Nextofkintable."Member Registration No." := "Registration Number";
        Nextofkintable."Entry Number" := NoSeriesMgmt.GetNextNo('NK', WorkDate, true);
        Nextofkintable.Insert();
        Imagestable."Registration Number" := "Registration Number";
        Imagestable."Image Entry" := NoSeriesMgmt.GetNextNo('IMG', WorkDate, true);
        Imagestable.Insert();
    end;

    procedure UpdateFullName()
    begin
        Name := "First Name" + ' ' + "Last Name" + ' ' + Surname;
    end;

    var
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        Nextofkintable: Record "Next of Kin";
        Imagestable: Record "Image";

}






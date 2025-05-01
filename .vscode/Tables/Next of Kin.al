table 50142 "Next of Kin"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry Number';
            // AutoIncrement = true;
            Editable = false;
        }
        field(2; "Member Registration No."; Code[20]) // Foreign Key
        {
            DataClassification = CustomerContent;
            Caption = 'Member Registration No.';
            //TableRelation = "Member Registration1"."Registration Number";

        }
        field(3; "Member Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Member Number';
        }
        field(4; "Next of Kin Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Next of Kin Name';
        }
        field(5; "Next of Kin Phone"; Code[15]) // Increased length for flexibility
        {
            DataClassification = ToBeClassified;
            Caption = 'Next of Kin Phone';
        }
        field(6; "Next of Kin Relationship"; Enum "Next of Kin Relationship")
        {
            DataClassification = ToBeClassified;
            Caption = 'Next of Kin Relationship';
        }
        field(7; "Next of Kin ID"; Code[10]) // Increased length to accommodate various formats
        {
            DataClassification = ToBeClassified;
            Caption = 'Next of Kin ID';
        }
        field(8; "Benevolent"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Benevolent';
        }
        field(9; "Allocation Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allocation Percentage';
            trigger OnValidate()
            begin
                if ("Allocation Percentage" < 0) or ("Allocation Percentage" > 100) then
                    Error('Allocation Percentage must be between 0 and 100.');
            end;
        }
    }

    keys
    {
        key(Key1; "Entry Number")
        {
            Clustered = true;
        }
        key(MemberFK; "Member Registration No.")
        {
        }
    }

    trigger OnInsert()

    var
        NextOfKinRec: Record "Next of Kin";
        MaxEntry: Integer;
        CountNextOfKin: Integer;
        NoSeriesMgmt: Codeunit NoSeriesManagement;

    begin
        // Check if member already has two next of kin entries
        "Entry Number" := NoSeriesMgmt.GetNextNo('NK', WorkDate, true);

        NextOfKinRec.SetRange("Member Registration No.", "Member Registration No.");
        if NextOfKinRec.FindSet() then begin
            CountNextOfKin := NextOfKinRec.Count;
            if CountNextOfKin >= 2 then
                Error('A member can only have a maximum of two next of kin entries.');
        end;
    end;

    //     Generate Entry Number if empty
    //     if "Entry Number" = '' then begin
    //         if NextOfKinRec.FindLast() then begin
    //             Evaluate(MaxEntry, NextOfKinRec."Entry Number");
    //             MaxEntry := MaxEntry + 1;
    //         end else
    //             MaxEntry := 1;
    //         "Entry Number" := PadStr(Format(MaxEntry, 0), 20, '0'); // Ensuring fixed-length formatting
    //     end;
    // end;
}

enum 50133 "Next of Kin Relationship"
{
    value(0; "Spouse") { }
    value(1; "Child") { }
    value(2; "Parent") { }
    value(3; "Sibling") { }
    value(4; "Grandparent") { }
    value(5; "Aunt/Uncle") { }
    value(6; "Cousin") { }
    value(7; "Friend") { }
}

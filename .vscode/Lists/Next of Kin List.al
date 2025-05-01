page 50135 "Next of Kin List"
{
    PageType = Listpart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Next of Kin";

    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field("Entry Number"; Rec."Entry Number")
                {
                    ApplicationArea = All;
                }
                field("Member Registration No."; Rec."Member Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Member Number"; Rec."Member Number")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin Name"; Rec."Next of Kin Name")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin Phone"; Rec."Next of Kin Phone")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin Relationship"; Rec."Next of Kin Relationship")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin ID"; Rec."Next of Kin ID")
                {
                    ApplicationArea = All;
                }
                field("Benevolent"; Rec."Benevolent")
                {
                    ApplicationArea = All;
                }
                field("Allocation Percentage"; Rec."Allocation Percentage")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}
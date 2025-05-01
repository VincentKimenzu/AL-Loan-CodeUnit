page 50117 "Member List1"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Members1;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Member Number"; Rec."Member Number")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = All;
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;
                }
                field("KRA PIN"; Rec."KRA PIN")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = All;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                }
                field("Country/Region"; Rec."Country/Region")
                {
                    ApplicationArea = All;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = All;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
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
page 50118 "Bank Accounts List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bank Accounts";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Bank Number"; Rec."Bank Number")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Balance"; Rec."Balance")
                {
                    ApplicationArea = All;
                }
                field("GL"; Rec."Balance")
                {
                    ApplicationArea = All;
                }
                Field("Telephone"; Rec."Telephone")
                {
                    ApplicationArea = All;
                }
                field("Branch"; Rec."Branch")
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
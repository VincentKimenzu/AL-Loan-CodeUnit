page 50119 "Saving List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Savings";

    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field("Account Number"; Rec."Account Number")
                {
                    ApplicationArea = All;
                }
                field("Member Number"; Rec."Member Number")
                {
                    ApplicationArea = All;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                }
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;
                }
                field("Product Name"; Rec."Product Name")
                {
                    ApplicationArea = All;
                }
                field("Balance"; Rec."Balance")
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
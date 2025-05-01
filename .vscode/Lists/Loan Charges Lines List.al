page 50134 "Loan Charges Lines List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loan Charges Lines";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                    ApplicationArea = All;
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = All;
                }
                field("Charge Code"; Rec."Charge Code")
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
            action(MyCustomAction) // Give your action a descriptive name
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}

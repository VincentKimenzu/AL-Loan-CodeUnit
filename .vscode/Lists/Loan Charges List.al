page 50123 "Loan Charges List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loan Charges1";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Charge Code"; Rec."Charge Code")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Withdrawal Calculation"; Rec."Withdrawal Calculation")
                {
                    ApplicationArea = All;
                }
                field("Percentage"; Rec.Percentage)
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("G/L Account"; Rec."G/L Account")
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
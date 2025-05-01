page 50124 "Loan Product Type"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Loan Product Type";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Loan Product Code"; Rec."Loan Product Code")
                {
                    ApplicationArea = All;
                    Caption = 'Loan Product Code';

                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';

                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                    Caption = 'Interest Rate';

                }
                field("Minimum Installment"; Rec."Minimum Installment")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Installment';

                }
                field("Maximum Installment"; Rec."Maximum Installment")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Installment';

                }
                field("Minimum Loan"; Rec."Minimum Loan")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Loan';

                }
                field("Maximum Loan"; Rec."Maximum Loan")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Loan';

                }
                field("Principal G/L Account"; Rec."Principal G/L Account")
                {
                    ApplicationArea = All;
                    Caption = 'Principal G/L Account';

                }
                field("Interest Receivable"; Rec."Interest Receivable")
                {
                    ApplicationArea = All;
                    Caption = 'Interest Receivable';

                }
                field("Interest Income G/L"; Rec."Interest Income G/L")
                {
                    ApplicationArea = All;
                    Caption = 'Interest Income G/L';

                }
                field("Penalty Receivables"; Rec."Penalty Receivables")
                {
                    ApplicationArea = All;
                    Caption = 'Penalty Receivables';

                }
                field("Penalty Income"; Rec."Penalty Income")
                {
                    ApplicationArea = All;
                    Caption = 'Penalty Income';

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


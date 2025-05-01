page 50129 "Loan List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loans1";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = All;
                }
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
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = All;
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = All;
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                }
                field("Loan Period"; Rec."Loan Period")
                {
                    ApplicationArea = All;
                }
                field("Principal Payment"; Rec."Principal Payment")
                {
                    ApplicationArea = All;
                }
                field("Monthly Interest"; Rec."Monthly Interest")
                {
                    ApplicationArea = All;
                }
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ApplicationArea = All;
                }
                field("Loan Balance"; Rec."Loan Balance")
                {
                    ApplicationArea = All;
                }
                field("Interest Balance"; Rec."Interest Balance")
                {
                    ApplicationArea = All;
                }
                field("Total Loan Balance"; Rec."Total Loan Balance")
                {
                    ApplicationArea = All;
                }
                field("Posted"; Rec."Posted")
                {
                    ApplicationArea = All;
                }
                field("Disbursment Account"; Rec."Disbursement Account")
                {
                    ApplicationArea = All;
                }
                field("Net Take Home"; Rec."Net Take Home")
                {
                    ApplicationArea = All;
                }
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = All;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = All;
                }
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                }
                field("Interest Due"; Rec."Interest Due")
                {
                    ApplicationArea = All;
                }
                field("Interest Paid"; Rec."Interest Paid")
                {
                    ApplicationArea = All;
                }
                field("Principal Paid"; Rec."Principal Paid")
                {
                    ApplicationArea = All;
                }
                field("Principal Due"; Rec."Principal Due")
                {
                    ApplicationArea = All;
                }
                field("Principal Balance"; Rec." Principal Balance")
                {
                    ApplicationArea = All;

                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Payment Frequency"; Rec."Payment Frequency")
                {
                    ApplicationArea = All;
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = All;
                }
                field("Loan Product Name"; Rec."Loan Product Name")
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
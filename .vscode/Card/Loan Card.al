page 50131 "Loan Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Loans1";

    layout
    {
        area(Content)
        {
            group("Loan Details")
            {
                field("Loan Number"; Rec."Loan Number") { ApplicationArea = All; }
                field("Member Number"; Rec."Member Number") { ApplicationArea = All; }
                field("Name"; Rec."Name") { ApplicationArea = All; }
                field("ID No."; Rec."ID No.") { ApplicationArea = All; }
                field("Loan Product Type"; Rec."Loan Product Type") { ApplicationArea = All; }
                field("Loan Product Name"; Rec."Loan Product Name") { ApplicationArea = All; }
                field("Status"; Rec."Status") { ApplicationArea = All; }
            }

            group("Loan Amount Details")
            {
                field("Amount Applied"; Rec."Amount Applied") { ApplicationArea = All; }
                field("Amount Approved"; Rec."Amount Approved") { ApplicationArea = All; }
                field("Interest Rate"; Rec."Interest Rate") { ApplicationArea = All; }
                field("Loan Period"; Rec."Loan Period") { ApplicationArea = All; }
            }

            group("Repayment Details")
            {
                field("Principal Payment"; Rec."Principal Payment") { ApplicationArea = All; }
                field("Monthly Interest"; Rec."Monthly Interest") { ApplicationArea = All; }
                field("Monthly Repayment"; Rec."Monthly Repayment") { ApplicationArea = All; }
                field("Total Loan Balance"; Rec."Total Loan Balance") { ApplicationArea = All; }
            }

            group("Disbursement Details")
            {
                field("Disbursement Account"; Rec."Disbursement Account") { ApplicationArea = All; }
                field("Bank Account"; Rec."Bank Account") { ApplicationArea = All; }
                field("Application Date"; Rec."Application Date") { ApplicationArea = All; }
                field("Disbursement Date"; Rec."Disbursement Date") { ApplicationArea = All; }
            }

            group("Captured By & Dates")
            {
                field("Captured By"; Rec."Captured By") { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("Payment Frequency"; Rec."Payment Frequency") { ApplicationArea = All; }
            }


            part(LoanChargesPart; "Loan Charge Lines Part")
            {
                SubPageLink = "Loan Number" = field("Loan Number");
                ApplicationArea = All;
            }
            part(Guarantorships; "Guarantorship Listpart")
            {
                ApplicationArea = All;
                SubPageLink =
                "Loan Number" = field("Loan Number");
                // "Guaranteed Member No." = field("Member Number");
                //  "Guaranteed Member Name" = field("Name");
            }


        }
    }

    actions
    {
        area(Processing)
        {
            action("Recalculate Loan")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    LoanCalc: Codeunit LoanCalculations;
                begin
                    LoanCalc.CalculateLoanRepayments(
                        Rec."Amount Applied", Rec."Amount Approved", Rec."Loan Period", Rec."Interest Rate",
                        Rec."Principal Payment", Rec."Monthly Interest", Rec."Monthly Repayment", Rec."Total Loan Balance");

                    Message('Loan calculations updated.');
                end;
            }

            action("Approve Loan")
            {
                ApplicationArea = All;
                Caption = 'Approve Loan';
                Image = Approve;
                trigger OnAction()
                var
                    LoanChargesMgmt: Codeunit 50111;
                begin
                    if Rec.Status = Rec.Status::Posted then
                        Error('You cannot approve a posted loan.');

                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify(true);

                    LoanChargesMgmt.GenerateLoanCharges(Rec."Loan Number");

                    Message('Loan Number "%1" has been approved and charges generated.', Rec."Loan Number");
                end;
            }

            action("Post Loan")
            {
                ApplicationArea = All;
                Caption = 'Post Loan';
                Image = Post;
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Only approved loans can be posted.');

                    Rec.Status := Rec.Status::Posted;
                    Rec.Modify(true);

                    Message('Loan Number "%1" has been posted.', Rec."Loan Number");
                end;
            }
        }
    }
}
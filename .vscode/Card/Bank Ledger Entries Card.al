page 50113 "Bank Ledger Entries Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bank Ledger Entries";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry Number"; Rec."Entry Number")
                {
                    ApplicationArea = All;
                }
                field("Bank Number"; Rec."Bank Number")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Number"; Rec."Document Number")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Member Number"; Rec."Member Number")
                {
                    ApplicationArea = All;
                }
                field("Loan Number"; Rec."Loan Number")
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
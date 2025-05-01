page 50133 "Savings Ledger Entries List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Savings Ledger Entries";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document Number"; Rec."Document Number")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount ")
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
                field("Account Number"; Rec."Account Number")
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
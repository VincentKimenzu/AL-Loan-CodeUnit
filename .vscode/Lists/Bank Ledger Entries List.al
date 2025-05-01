page 50114 "Bank Ledger Entries List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bank Ledger Entries";

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
            action(MyCustomAction) // Give your action a descriptive name
            {
                ApplicationArea = All;
                Caption = 'My Custom Action';

                trigger OnAction()
                begin
                    // Action logic goes here
                end;
            }
        }
    }

    var
        myInt: Integer;
}

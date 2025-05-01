page 50201 "Guarantorship Listpart"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Guarantorship;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Guarantor Account"; Rec."Guarantor Account")
                {
                    ApplicationArea = All;
                }
                field("Member Number"; Rec."Member Number")
                {
                    ApplicationArea = All;
                }
                field("Guarantor Name"; Rec."Guarantor Name")
                {
                    ApplicationArea = All;
                }
                field("Amount Guaranteed"; Rec."Amount Guaranteed")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        GuarantorshipMgt: Codeunit "GuarantorshipManagement";
                    begin
                        GuarantorshipMgt.ValidateGuarantorshipLimit(Rec."Guarantor Account", Rec."Amount Guaranteed");
                    end;
                }
                field("Guarantorship Percentage"; Rec."Guarantorship Percentage")
                {
                    ApplicationArea = All;
                }
                field("Current Commited"; Rec."Current Committed")
                {
                    ApplicationArea = All;
                }
                field("Guaranteed Member No."; Rec."Guaranteed Member No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Guaranteed Member Name")
                {
                    ApplicationArea = All;
                }
                field("Loan Balance"; Rec."Loan Balance")
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
                    // Future actions
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Auto-fill Loan Number
        if Rec."Loan Number" = '' then
            Rec."Loan Number" := GetLoanNumberFromPageFilter();

        // Auto-fill Guaranteed Member No.
        if Rec."Guaranteed Member No." = '' then
            Rec."Guaranteed Member No." := GetGuaranteedMemberNoFromPageFilter();

        // Auto-fill Guaranteed Member Name
        if Rec."Guaranteed Member Name" = '' then
            Rec."Guaranteed Member Name" := GetGuaranteedMemberNameFromPageFilter();
    end;

    local procedure GetLoanNumberFromPageFilter(): Code[20]
    var
        LoanNumberFilter: Text;
    begin
        LoanNumberFilter := Rec.GetFilter("Loan Number");
        if LoanNumberFilter <> '' then
            exit(LoanNumberFilter);
        exit('');
    end;

    local procedure GetGuaranteedMemberNoFromPageFilter(): Code[50]
    var
        FilterText: Text;
    begin
        FilterText := Rec.GetFilter("Guaranteed Member No.");
        if FilterText <> '' then
            exit(FilterText);
        exit('');
    end;

    local procedure GetGuaranteedMemberNameFromPageFilter(): Text[50]
    var
        FilterText: Text;
    begin
        FilterText := Rec.GetFilter("Guaranteed Member Name");
        if FilterText <> '' then
            exit(FilterText);
        exit('');
    end;
}

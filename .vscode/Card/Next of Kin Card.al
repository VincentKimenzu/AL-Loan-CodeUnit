page 50146 "Next of Kin Card"
{
    PageType = Card;
    SourceTable = "Next of Kin";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group("Next of Kin Details")
            {
                field("Member Registration No."; Rec."Member Registration No.")
                {
                    ApplicationArea = All;
                    Editable = false; // Prevent manual editing
                }
                field("Next of Kin Name"; Rec."Next of Kin Name")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin Phone"; Rec."Next of Kin Phone")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin Relationship"; Rec."Next of Kin Relationship")
                {
                    ApplicationArea = All;
                }
                field("Next of Kin ID"; Rec."Next of Kin ID")
                {
                    ApplicationArea = All;
                }
                field("Benevolent"; Rec.Benevolent)
                {
                    ApplicationArea = All;
                }
                field("Allocation Percentage"; Rec."Allocation Percentage")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

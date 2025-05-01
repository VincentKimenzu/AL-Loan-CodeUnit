
page 50122 "Loan Charge Lines Part"
{
    PageType = ListPart;
    SourceTable = "Loan Charges Lines";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Charge Code"; Rec."Charge Code")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

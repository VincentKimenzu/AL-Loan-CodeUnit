page 50137 "Image List"
{
    PageType = Listpart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Image;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Image Entry"; Rec."Image Entry")
                {
                    ApplicationArea = All;
                }
                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = All;
                }
                field("Member Photo"; Rec."Member Photo")
                {
                    ApplicationArea = All;
                }
                field("ID Front"; Rec."ID Front")
                {
                    ApplicationArea = All;
                }
                field("ID Back"; Rec."ID Back")
                {
                    ApplicationArea = All;
                }
                field("Passport"; Rec."Passport")
                {
                    ApplicationArea = All;
                }
                field("Signature"; Rec."Signature")
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
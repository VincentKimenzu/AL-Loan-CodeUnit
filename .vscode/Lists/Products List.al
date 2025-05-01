page 50132 "Products List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Products";

    layout
    {
        area(Content)
        {
            repeater(GroupName)

            {
                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;

                }
                field("Product Description"; Rec."Product Description")
                {
                    ApplicationArea = All;
                }
                field("Product GL"; Rec."Product GL")
                {

                    ApplicationArea = All;
                }
                field("Products Withdrawal"; Rec."Products Withdrawal")
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
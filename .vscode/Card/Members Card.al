page 50112 "Member Card1"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Members1;

    layout
    {
        area(Content)
        {
            Group("PERSONAL INFORMATION")
            {
                field("Member Number"; Rec."Member Number")
                {
                    Applicationarea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Surname"; Rec.Surname)
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
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                }
                field("KRA PIN"; Rec."KRA PIN")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field("Age"; Rec."Age")
                {
                    ApplicationArea = All;
                }
                Field("Spouse ID No."; Rec."Spouse ID No.")
                {
                    ApplicationArea = All;
                }
                field("Spouse Phone No."; Rec."Spouse Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Spouse Name"; Rec."Spouse Name")
                {
                    ApplicationArea = All;
                }
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = All;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                }
                Group("ADDRESS AND LOCATION DETAILS")
                {
                    field("Country/Region"; Rec."Country/Region")
                    {
                        ApplicationArea = All;
                    }
                    field("County"; Rec."County")
                    {
                        ApplicationArea = All;
                    }
                    field("Sub County"; Rec."Sub County")
                    {
                        ApplicationArea = All;
                    }
                    field("Location"; Rec."Location")
                    {
                        ApplicationArea = All;
                    }
                    field("Sub Location"; Rec."Sub Location")
                    {
                        ApplicationArea = All;
                    }
                    field("Village/ Estate"; Rec."Village/Estate")
                    {
                        ApplicationArea = All;
                    }
                }
                Group("EMPLOYMENT DETAILS")
                {
                    field("Employment Type"; Rec."Employment Type")
                    {
                        ApplicationArea = All;
                    }
                    field("Employer"; Rec."Employer")
                    {
                        ApplicationArea = All;
                    }
                    field("Employment Position"; Rec."Employment Position")
                    {
                        ApplicationArea = All;
                    }
                    field("Employment Location"; Rec."Employment Location")
                    {
                        ApplicationArea = All;
                    }
                }
                Group("BANK DETAILS")
                {
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Branch Name"; Rec."Branch Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Branch Code"; Rec."Branch Code")
                    {
                        ApplicationArea = All;
                    }


                }
                part("Guarantorship"; "Guarantorship ListPart")
                {
                    SubPageLink = "Member Number" = field("Member Number");
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
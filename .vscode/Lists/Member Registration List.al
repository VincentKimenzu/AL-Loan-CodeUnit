page 50143 "Member Registration List1"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Member Registration1";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
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
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field("KRA PIN"; Rec."KRA PIN")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field("Spouse Name"; Rec."Spouse Name")
                {
                    ApplicationArea = All;
                }
                field("Spouse ID No."; Rec."Spouse ID No.")
                {
                    ApplicationArea = All;
                }
                field("Spouse Phone No."; Rec."Spouse Phone No.")
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
                field("Age"; Rec.Age)
                {
                    ApplicationArea = All;
                }
                field("County"; Rec.County)
                {
                    ApplicationArea = All;
                }
                field("Sub County"; Rec."Sub County")
                {
                    ApplicationArea = All;
                }
                field("Location"; Rec.Location)
                {
                    ApplicationArea = All;

                }
                field("Sub Location"; Rec."Sub Location")
                {
                    ApplicationArea = All;
                }
                field("Village/Estate"; Rec."Village/Estate")
                {
                    ApplicationArea = All;
                }
                field("Country/Region"; Rec."Country/Region")
                {
                    ApplicationArea = All;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = All;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
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
        }
    }

    actions
    {
        area(Processing)
        {
            action(View)
            {
                //Caption = 'Approve Member';
                ApplicationArea = All;
                Promoted = true;
                Image = Approve;

                trigger OnAction()
                var
                    MemberRec: Record "Member Registration1"; // Assuming this is the table you're working with
                begin
                    // Check if the member status is Pending
                    memberCard.RunModal();
                end;
            }


        }
    }
    var
        memberCard: Page "Member Registration Card1";

}


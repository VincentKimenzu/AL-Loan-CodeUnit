page 50144 "Member Registration Card1"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Member Registration1";

    layout
    {
        area(Content)
        {
            group("PERSONAL INFORMATION")
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

            }
            group("ADDRESS AND LOCATION DETAILS")
            {
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
            }
            group("EMPLOYMENT DETAILS")
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
            group("BANK DETAILS")
            {
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
            }
            part("Next of Kin"; "Next of Kin List")
            {
                SubPageLink = "Member Registration No." = field("Registration Number");
                ApplicationArea = All;
            }
            part("Image"; "Image List")
            {
                SubPageLink = "Registration Number" = field("Registration Number");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send Approval")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    IF Rec.Status = Rec.Status::Open then begin
                        Rec.Status := Rec.Status::"Pending Approval";
                        Rec.Modify();
                        Message('Member Registration has been sent for approval');
                    end
                    else
                        Message('Status must be Open.');
                end;
            }

            action("Approve")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Approve;

                trigger OnAction()
                begin
                    IF Rec.Status = Rec.Status::"Pending Approval" then begin
                        Rec.Status := Rec.Status::Approved;
                        Rec.Modify();
                        Message('Member has been approved.');
                    end
                    else
                        Message('Status must be Pending Approval.');
                end;
            }

            action("Create Member")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Create;

                trigger OnAction()
                var
                    createdMembers: Record "Members1";
                begin
                    if Rec.Status <> Rec.Status::Approved then begin
                        Message('Status must be Approved before creating a member.');
                        exit;
                    end;

                    Rec.Status := Rec.Status::Created;
                    Rec.Modify();

                    if createdMembers.Get(Rec."Registration Number") then begin
                        Message('A member with Registration Number %1 already exists!', Rec."Registration Number");
                        exit;
                    end;

                    createdMembers.TransferFields(Rec);
                    createdMembers.Status := createdMembers.Status::Active;
                    createdMembers."Member Number" := NoSeriesMgmt.GetNextNo('MEMBER', WorkDate, true);
                    createdMembers.Insert();
                    NextOfKinRec.SetRange("Member Registration No.", Rec."Registration Number");
                    NextOfKinRec."Member Number" := createdMembers."Member Number";
                    ImageRec.SetRange("Registration Number", Rec."Registration Number");
                    ImageRec."Member Number" := createdMembers."Member Number";
                    ProductsRec.FindSet();
                    repeat
                        SavingsRec.init();
                        SavingsRec."Account Number" := ProductsRec."Product Code" + '-' + createdMembers."Member Number";
                        SavingsRec."Member Number" := createdMembers."Member Number";
                        SavingsRec."Member Name" := createdMembers.Name;
                        SavingsRec."Product Code" := ProductsRec."Product Code";
                        SavingsRec."Product Name" := ProductsRec."Product Description";

                        SavingsRec.Insert();
                        Message(Format(SavingsRec."Account Number"));
                    until ProductsRec.Next() = 0;
                    Message('Member created successfully. Member Number: %1', createdMembers."Member Number");
                end;

            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        NextOfKinRec.Reset();
        NextOfKinRec.SetRange("Member Registration No.", Rec."Registration Number");
        if not NextOfKinRec.FindSet() then
            Clear(NextOfKinRec);
    end;

    var
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        NextOfKinRec: Record "Next of Kin";
        ImageRec: Record Image;
        ProductsRec: Record "Products";
        SavingsRec: Record "Savings";



}

table 50123 "Loans1"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Loan Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(2; "Member Number"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Members1;



        }
        field(3; "Name"; Text[50])

        {

            fieldclass = flowfield;
            calcformula = lookup(Members1.Name Where("Member Number" = field("Member Number")));
        }
        field(4; "ID No."; Code[8])
        {
            fieldclass = flowfield;
            calcformula = lookup(Members1."ID No." Where("Member Number" = field("Member Number")));

        }
        field(5; "Amount Applied"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin

                RecalculateLoan();
            end;
        }

        field(6; "Amount Approved"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                RecalculateLoan();
            end;
        }

        field(7; "Interest Rate"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Loan Product Type"."Interest Rate" Where("Loan Product Code" = field("Loan Product Type")));

        }

        field(8; "Loan Period"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                RecalculateLoan();
            end;
        }

        field(9; "Principal Payment"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Monthly Interest"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Monthly Repayment"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        Field(12; "Loan Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Interest Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Total Loan Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Disbursement Account"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Net Take Home"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Captured By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Application Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Disbursement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Status"; Enum "Loan Status")
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                RecalculateLoan();
            end;
        }
        field(24; "Bank Account"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Interest Due"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Interest Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Principal Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Principal Due"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; " Principal Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Payment Frequency"; Enum "Loan payment Frequency")

        {
            DataClassification = ToBeClassified;
        }
        field(32; "Loan Product Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Loan Product Type";
        }
        field(33; "Loan Product Name"; Text[50])
        {
            FieldClass = Flowfield;
            CalcFormula = lookup("Loan Product Type"."Description" Where("Loan Product Code" = field("Loan Product Type")));
        }
    }


    keys
    {
        key(Key1; "Loan Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
        Guarantorship: Record "Guarantorship";



    trigger OnInsert()
    begin

        if "Loan Number" = '' then begin
            "Loan Number" := NoSeriesMgmt.GetNextNo('LOAN', WorkDate, true);
        end;
        "Captured By" := UserId;
        // Guarantorship."Loan Number" := "Loan Number";
        // Guarantorship.Insert()


    end;

    trigger OnModify()
    begin
        if "Status" = "Status"::Posted then
            Error('This loan has been posted and cannot be modified.');

        RecalculateLoan(); // Call the function to update calculations
    end;

    //  Declare the procedure within the table

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


    var
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        LoanProductType: Record "Loan Product Type";



    local procedure RecalculateLoan()
    var
        LoanCalc: Codeunit LoanCalculations;
    begin
        if "Status" <> "Status"::Posted then begin
            LoanCalc.CalculateLoanRepayments(
                "Amount Applied",
                "Amount Approved",
                "Loan Period",
                "Interest Rate",
                "Principal Payment",
                "Monthly Interest",
                "Monthly Repayment",
                "Total Loan Balance"
            );
        end;
    end;
}







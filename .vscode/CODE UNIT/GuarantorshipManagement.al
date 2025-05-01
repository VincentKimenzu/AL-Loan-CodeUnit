codeunit 50110 "GuarantorshipManagement"
{
    Subtype = Normal;

    procedure ValidateGuarantorshipLimit(GuarantorAccount: Code[20]; AmountToGuarantee: Decimal)
    var
        SavingsRec: Record Savings;
    begin
        if not SavingsRec.Get(GuarantorAccount) then
            Error('Guarantor account "%1" does not exist.', GuarantorAccount);

        if AmountToGuarantee > SavingsRec."Balance" then
            Error(
              'The amount guaranteed (%1) exceeds the guarantor''s available balance (%2).',
              Format(AmountToGuarantee),
              Format(SavingsRec."Balance")
            );
    end;

    procedure ValidateGuarantorshipRelation(GuarantorMemberNo: Code[50]; GuaranteedMemberNo: Code[50])
    var
        MemberRec: Record Members1;
    begin
        if not MemberRec.Get(GuaranteedMemberNo) then
            Error('The guaranteed member "%1" does not exist.', GuaranteedMemberNo);

        if GuarantorMemberNo = GuaranteedMemberNo then
            Error('A member cannot guarantee their own loan.');
    end;
}

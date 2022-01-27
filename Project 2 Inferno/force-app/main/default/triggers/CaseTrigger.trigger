trigger CaseTrigger on Case (before insert) {
    CaseTrigger_Helper.CheckAccountTier(Trigger.new);
    CaseTrigger_Helper.CheckVideoReports(Trigger.new);
}
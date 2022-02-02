public class cronGenerator {
   public static List<String> createCron(Account a) {
        Date serviceEndDate = date.today().addMonths(1).toStartOfMonth(); //First day of the next month
        Integer expDay = serviceEndDate.day();
        Integer expMonth = serviceEndDate.month();
        Integer expYear = serviceEndDate.year();           
        String cronExpression = '0 0 0 ' + expDay + ' ' + expMonth + ' ? ' + expYear;
        List<String> cronList = new List<String>();
        cronList.add(cronExpression);
        return cronList;
    }
}
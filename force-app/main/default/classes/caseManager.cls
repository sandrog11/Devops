public with sharing class caseManager {
    //constructor
    /*public caseManager() {

    }*/
    @AuraEnabled
    public static List<Case> retrieveCaseByCaseNumber(String caseNumber){
            if (String.isNotBlank(caseNumber))
            {
                String searchCase = '%'+caseNumber+'%';
                return [SELECT Id, CaseNumber, IsClosed, ClosedDate,  Account.Name, Origin, Description, Priority, Subject, Status
                FROM Case
                WHERE CaseNumber like :searchCase];
            }
            else {
                return NULL;   
            }
        }
        @AuraEnabled
        public static string closeCase(String caseId){
            String message;
            try {
                Case cs = new Case(Id=caseId);
                cs.Status = 'Closed';
                update cs;
                message = 'Success';
            } catch (Exception e) {
                message = e.getMessage();
            }
            return message;
        }
}
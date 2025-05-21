public with sharing class caseCommentManager {
    @AuraEnabled
    public static String addCaseComment(Id caseId, String cBody){
        String result = 'false';
        try {
            if (String.isNotBlank(caseId) && String.isNotBlank(cBody))
            {
                CaseComment caseComment = new CaseComment (ParentId = caseId, CommentBody = cBody);
                insert caseComment;
                result= 'success';
            }
        } catch (DmlException e) {
            throw new AuraHandledException(e.getMessage());
        }
        return result;
    }
}
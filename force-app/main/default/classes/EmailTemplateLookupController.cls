public class EmailTemplateLookupController {
    // Metodo per ottenere tutti gli EmailTemplate
    public List<EmailTemplate> getEmailTemplates() {
        return [SELECT Id, Name, Description, DeveloperName, TemplateType FROM EmailTemplate];
    }
}
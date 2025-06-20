global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null];
        
        if(leads.size() > 0){
            List<Lead> newLeads = new List<Lead>();
            
            for(Lead lead : leads){
                lead.LeadSource = 'DreamForce';
                newLeads.add(lead);
            }
            
            update newLeads;
        }
    }
}
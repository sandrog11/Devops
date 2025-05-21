trigger PositionTrigger on Position__c (before insert) {
    if (Trigger.isBefore)
    {
        if (Trigger.isInsert)
        {
            for (Position__c pos: Trigger.new)
            {
                if (pos.Functional_Area__c == 'Information Technology' && pos.Type__c=='Part Time')
                {
                    pos.Min_Pay__c=20000;
                    pos.Max_Pay__c=40000;
                }
                else if (pos.Type__c=='Full Time')
                {
                    pos.Min_Pay__c=40000;
                    pos.Max_Pay__c=80000;
                }
            }
        }
    }
}
global class LeadProcessor implements Database.Batchable<sObject>{
    global Integer count = 0;
  
    global Database.QueryLocator start(Database.BatchableContext bc){
        return   Database.getQueryLocator('SELECT ID, LeadSource FROM Lead');
        }
    global void execute (Database.BatchableContext bc, List<Lead> L_list){
        List<Lead> L_List_new = new List<Lead>();
        
        for(lead L:L_list){
            L.leadsource = 'Dreamforce';
            L_list_new.add(L);
            count += 1;
            
        }
        update L_list_new;
    }
    global void finish(Database.BatchableContext bc){
        system.debug('count = ' +count);
    }
}

public with sharing class SendMassEmail {

    //public static void SendMassEmailByCampaignId(Id campaignId, Id templateId) {
    public static void SendMassEmailByCampaignId(Id campaignId) {
        
        //get Campaign Members
        final List<Id> lstContactIds = new List<Id>();
        List<CampaignMember> lstCM = [SELECT Id, ContactId FROM CampaignMember WHERE CampaignId = :campaignId];
        for (CampaignMember oCM : lstCM) {
			lstContactIds.add(oCM.ContactId);            
        }
		System.debug('lstContactIds:'+lstContactIds);
        
        SendMassEmail(lstContactIds);
        /*
        //reserve capacity
        Messaging.reserveSingleEmailCapacity(2);
        
        //Send Email
        Messaging.SingleEmailMessage mail = Messaging.renderStoredEmailTemplate('00X3t0000020wPKEAY', '0033t00003fa1mfAAA', null);
        String[] toAddresses = new String[] {'theseptemberguy@gmail.com'}; 
		//mail.setTargetObjectId(ownerId);
        mail.setToAddresses(toAddresses);
        mail.setSubject(mail.getSubject());
        mail.setHtmlBody(mail.gethtmlBody());
        mail.saveAsActivity = false;
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		*/
        
    }

    public static void SendMassEmail(List<Id> lstContactIds) {
        Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
        mail.setTargetObjectIds(lstContactIds);
        mail.setTemplateId('00X3t0000020wPKEAY');
        Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail });
    }
    
}
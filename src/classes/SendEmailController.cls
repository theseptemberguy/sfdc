public with sharing class SendEmailController {
    public SendEmailController() {
        Messaging.reserveSingleEmailCapacity(2);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'jkumarvk@gmail.com'}; 
        String[] ccAddresses = new String[] {'jkumarvk@outlook.com'};
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        mail.setReplyTo('support@acme.com');
        mail.setSenderDisplayName('Salesforce Support');
        mail.setSubject('New Case Created : ' + case.Id);
        mail.setBccSender(false);
        mail.setUseSignature(false);
        mail.setPlainTextBody('Test Email from Salesforce');
        mail.setHtmlBody('<b>Test Email from Salesforce</b>');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}
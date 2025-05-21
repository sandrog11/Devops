@RestResource(urlMapping='/ContentVersion/*')
global class WsContentDocument {
    @HttpPost
    global static String createContentDocument(String title, String description, String fileType, String accountId, String base64Data) {
        Blob fileBlob = EncodingUtil.base64Decode(base64Data);
        
        // Create a new ContentVersion record
        ContentVersion newVersion = new ContentVersion(
            Title = title,
            Description = description,
            PathOnClient = 'dummy.pdf', // Dummy file name for reference
            VersionData = fileBlob,
            IsMajorVersion = true
        );
        
        // Insert the ContentVersion record
        insert newVersion;
        
         // Publish the ContentVersion to create the associated ContentDocument
        newVersion = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id = :newVersion.Id];
        
        // Create a new ContentDocumentLink to associate the ContentDocument with the Account
        ContentDocumentLink newLink = new ContentDocumentLink(
            ContentDocumentId = newVersion.ContentDocumentId,
            LinkedEntityId = accountId,  // ID of the Account record
            ShareType = 'V'
        );
        
        // Insert the ContentDocumentLink record
        insert newLink;
        
        return newVersion.ContentDocumentId;
    }

}
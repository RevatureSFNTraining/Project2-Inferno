// Israel Escobedo, Project 2, 02/03/2022

trigger ProductTrigger on Product2 (after delete) {
    
    // If a Product record is deleted it calls the following methods to delete related records in Receipts and Campaign Products. 
    if(Trigger.isDelete){      
       ProductHelper.deleteReceipt();
       ProductHelper.deleteCampaignProd();
    }
}
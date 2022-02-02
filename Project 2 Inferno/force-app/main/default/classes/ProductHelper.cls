// Israel Escobedo, Project 2, 02/03/2022

public class ProductHelper {
    
    // Method deletes Product records using a String of the name of the product/service as a parameter.
    public static void deleteProduct(String service){
        
        // Creates a list of Prodcut Records.
        List <Product2> serviceList = [SELECT Name FROM Product2];
		
        // Creates a list for Product records that are being deleted.
        List <Product2> deleteList1 = new List <Product2>();
		
            // For loop searches through the Product list.
            for(Product2 servProduct: serviceList){
                
                // Checks if the product record matches the name of the product/service being deleted.
                // If true the record is placed in the delete list.
                if(servProduct.Name == service){
                    deleteList1.add(servProduct);
                }
                else{
                     // A debug message appears in the log if there is no product record with the matching name.
           			System.debug('No product or service with that name.');
                }
            }
            // The list of Product records to be deleted is deleted.
            Database.delete(deleteList1);
    }
    
    // The method deletes Receipt records.
    public static void deleteReceipt(){
        
        // Creates a list of all Receipt records.
        List <Receipt__c> receiptList = [SELECT Name, Product__r.Name FROM Receipt__c];
        
        // Creates a list for Receipt records that are being deleted.
        List <Receipt__c> deleteList2 = new List <Receipt__c>();

        // For loop searches through Receipt records.
        for(Receipt__c receipt : receiptList){
            
            // Converts the product name into a String.
            String prod1 = String.valueOf(receipt.Product__r.Name);
            
            // Checks if the product name is null, if so the Receipt record is placed in the delete list.
            if(prod1 == null){
                deleteList2.add(receipt);
            }
        } 
        // The list of Receipt records to be deleted is deleted.
        Database.delete(deleteList2);
    }

    // The method deletes Campaign Product records.
    public static void deleteCampaignProd(){
        
        // Creates a list of all Campaign Product records.
        List <Campaign_Product__c> productList = [SELECT Name, Product__r.Name FROM Campaign_Product__c];

        // Creates a list for Campaign Product records that are being deleted.
        List <Campaign_Product__c> deleteList3= new List <Campaign_Product__c>();
               
        // For loop searches through Campaign Product records.
        for(Campaign_Product__c campProduct : productList){
            
            // Converts the product name into a String.
            String prod2 = String.valueOf(campProduct.Product__r.Name);
            
            // Checks if the product name is null, if so the Receipt record is placed in the delete list.
            if(prod2 == null){
                deleteList3.add(campProduct);
            }
        }  
        // The list of Campaign Product records to be deleted is deleted.
        Database.delete(deleteList3);
    }
}
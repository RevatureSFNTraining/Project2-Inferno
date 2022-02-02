// Israel Escobedo, Project 2, 02/03/2022
// Test Apex File

@isTest
public class ProductHelperTest {
    
    // Positive Test for the deleteProduct method.
    @isTest static void testPosDelProducts(){
         ProductHelper.deleteProduct('Free');
    }
   
     // Negative Test for the deleteProduct method.
    @isTest static void testNegDelProducts(){
         ProductHelper.deleteProduct('Cheese');
    }
    
    // Tests the deleteRecipt method.
    @isTest static void testDeleteReceipts(){
         ProductHelper.deleteReceipt();
    }
    
    // Tests the deleteCampaignProd method.
    @isTest static void testDelCampaignProducts(){
         ProductHelper.deleteCampaignProd();
    }   
    
    // Tests the trigger.
    @isTest static void testTrigger(){
        Product2 cheese = new Product2(Name='Cheddar');
        insert cheese;
              
        ProductHelper.deleteProduct('Cheddar');        
    }
}
import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_ON_CARD_FIELD from '@salesforce/schema/Account.Name_On_Card__c';
import CARD_NUMBER_FIELD from '@salesforce/schema/Account.Card_Number__c';
import CARD_TYPE_FIELD from '@salesforce/schema/Account.Card_Type__c';
import CVV_FIELD from '@salesforce/schema/Account.CVV__c';
import EXPIRATION_DATE_FIELD from '@salesforce/schema/Account.Expiration_Date__c';
import CARD_STATUS_FIELD from '@salesforce/schema/Account.Card_Status__c';

export default class CardView extends LightningElement {
    accountApiName = ACCOUNT_OBJECT;
    currentAccountId = "0011100002CAJ6PAAX";
    a_nameOnCard = NAME_ON_CARD_FIELD;
    a_cardNumber = CARD_NUMBER_FIELD;
    a_cardType = CARD_TYPE_FIELD;
    a_cvv = CVV_FIELD;
    a_cardExpiration = EXPIRATION_DATE_FIELD;
    a_cardStatus = CARD_STATUS_FIELD;
}
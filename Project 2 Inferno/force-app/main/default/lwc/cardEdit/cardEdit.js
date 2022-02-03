import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_ON_CARD_FIELD from '@salesforce/schema/Account.Name_On_Card__c';
import CARD_NUMBER_FIELD from '@salesforce/schema/Account.Card_Number__c';
import CARD_TYPE_FIELD from '@salesforce/schema/Account.Card_Type__c';
import CVV_FIELD from '@salesforce/schema/Account.CVV__c';
import EXPIRATION_DATE_FIELD from '@salesforce/schema/Account.Expiration_Date__c';

export default class CardEdit extends LightningElement {
    accountApiName = ACCOUNT_OBJECT;
    currentAccountId = "0011100002CAJ6PAAX";
    fields = [NAME_ON_CARD_FIELD, CARD_NUMBER_FIELD, CARD_TYPE_FIELD, CVV_FIELD, EXPIRATION_DATE_FIELD]
}
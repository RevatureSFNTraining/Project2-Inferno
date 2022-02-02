import { LightningElement, api, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import EMAIL_FIELD from '@salesforce/schema/Account.Email__c';
import PASSWORD_FIELD from '@salesforce/schema/Account.Password__c';

export default class AccountEdit extends LightningElement {
    accountApiName = ACCOUNT_OBJECT;
    currentAccountId = "001630000194XIxAAM";
    a_name = NAME_FIELD;
    a_email = EMAIL_FIELD;
    a_password = PASSWORD_FIELD;
    fields = [NAME_FIELD, EMAIL_FIELD, PASSWORD_FIELD]
}
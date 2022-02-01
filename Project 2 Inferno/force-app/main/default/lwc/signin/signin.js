import { LightningElement, wire, api } from 'lwc';
import getAccount from '@salesforce/apex/signinAccountController.getAccount';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';


    const FIELDS = [
        'Account.Name',
        'Account.Email__c',
        'Account.Membership_Status__c',
        'Account.Password__c',
        'Account.Name_On_Card__c',
        'Account.Card_Number__c',
        'Account.Card_Type__c',
        'Account.CVV__c',
        'Account.Expiration_Date__C',
        'Account.Card_Status__c',
        'Account.BillingAddress',
    ];

export default class Signin extends LightningElement {
    email = '';
    tempemail = '';
    password = '';
    myaccount = ACCOUNT_OBJECT;
    id = 'test';
    error;
    //@wire(getAccount, {email: '$email'}) account;

    async handleClick(event){
        let myAccount = { 'sobjectType': 'Account' };
        this.email = this.tempemail;
        await getAccount({email: this.email, password: this.password}).then(result => {this.id = result;}).catch(error => {this.error = error;});
        if(!this.id==null){
            this.dispatchEvent(new CustomEvent('signin', {detail: this.id}));
        }

    }

    emailChange(event){
        this.tempemail = event.detail.value;
    }

    passwordChange(event){
        this.password = event.detail.value;
    }
}
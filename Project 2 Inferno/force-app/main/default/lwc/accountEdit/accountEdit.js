import { LightningElement, api, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import EMAIL_FIELD from '@salesforce/schema/Account.Email__c';
import PASSWORD_FIELD from '@salesforce/schema/Account.Password__c';

import { subscribe, APPLICATION_SCOPE, MessageContext} from 'lightning/messageService';
import RECORD_SELECTED_CHANNEL from '@salesforce/messageChannel/Record_Selected__c';

export default class AccountEdit extends LightningElement {
    accountApiName = ACCOUNT_OBJECT;
    currentAccountId;
    a_name = NAME_FIELD;
    a_email = EMAIL_FIELD;
    a_password = PASSWORD_FIELD;
    fields = [NAME_FIELD, EMAIL_FIELD, PASSWORD_FIELD];
    @wire(MessageContext)
    messageContext;
    
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                RECORD_SELECTED_CHANNEL,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    handleMessage(message) {
        this.currentAccountId = message.recordId;
    }

    connectedCallback() {
        this.subscribeToMessageChannel();
    }
}
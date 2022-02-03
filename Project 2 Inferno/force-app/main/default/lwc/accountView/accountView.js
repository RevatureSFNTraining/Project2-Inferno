import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ID_FIELD from '@salesforce/schema/Account.Id';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import EMAIL_FIELD from '@salesforce/schema/Account.Email__c';
import PASSWORD_FIELD from '@salesforce/schema/Account.Password__c';
import OWNER_ID_FIELD from '@salesforce/schema/Account.OwnerId';
import MEMBERSHIP_STATUS_FIELD from '@salesforce/schema/Account.Membership_Status__c';

export default class AccountView extends LightningElement {
    accountApiName = ACCOUNT_OBJECT;
    currentAccountId = "0011100002CAJ6PAAX";
    a_id = ID_FIELD;
    a_name = NAME_FIELD;
    a_email = EMAIL_FIELD;
    a_membership = MEMBERSHIP_STATUS_FIELD;
    a_password = PASSWORD_FIELD;
    a_ownerId = OWNER_ID_FIELD;
}
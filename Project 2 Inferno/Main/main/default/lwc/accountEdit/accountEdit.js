import { LightningElement, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import CARD_NUMBER_FIELD from '@salesforce/schema/Account.Card_Number__c';
import CARD_STATUS_FIELD from '@salesforce/schema/Account.Card_Status__c';
import CARD_TYPE_FIELD from '@salesforce/schema/Account.Card_Type__c';
import CVV_FIELD from '@salesforce/schema/Account.CVV__c';
import EMAIL_FIELD from '@salesforce/schema/Account.Email__c';
import EXPIRATION_DATE_FIELD from '@salesforce/schema/Account.Expiration_Date__c';
import MEMBERSHIP_STATUS_FIELD from '@salesforce/schema/Account.Membership_Status__c';
import NAME_ON_CARD_FIELD from '@salesforce/schema/Account.Name_On_Card__c';
import PASSWORD_FIELD from '@salesforce/schema/Account.Password__c';

import USER_OBJECT from '@salesforce/schema/User';
import CURRENT_USER_ID from '@salesforce/user/Id';
import USER_ID_FIELD from '@salesforce/schema/User.Id';
import USER_NAME_FIELD from '@salesforce/schema/User.Name';
import USER_ROLE_FIELD from '@salesforce/schema/User.UserRoleId';
import USER_PROFILE_FIELD from '@salesforce/schema/User.ProfileId';
import USER_USERNAME_FIELD from '@salesforce/schema/User.Username';

export default class AccountEdit extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD, CARD_NUMBER_FIELD, CARD_STATUS_FIELD, CARD_TYPE_FIELD, CVV_FIELD, EMAIL_FIELD, EXPIRATION_DATE_FIELD, MEMBERSHIP_STATUS_FIELD, NAME_ON_CARD_FIELD, PASSWORD_FIELD];
    @api userApiName = USER_OBJECT;
    @api currentUserId = CURRENT_USER_ID;
    user_id = USER_ID_FIELD;
    user_name = USER_NAME_FIELD;
    user_role = USER_ROLE_FIELD;
    user_profile = USER_PROFILE_FIELD;
    user_username = USER_USERNAME_FIELD;
}
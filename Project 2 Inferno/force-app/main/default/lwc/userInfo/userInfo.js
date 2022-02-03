import { LightningElement, api } from 'lwc';
import USER_OBJECT from '@salesforce/schema/User';
import CURRENT_USER_ID from '@salesforce/user/Id';
import USER_ID_FIELD from '@salesforce/schema/User.Id';
import USER_NAME_FIELD from '@salesforce/schema/User.Name';
import USER_USERNAME_FIELD from '@salesforce/schema/User.Username';

export default class UserInfo extends LightningElement {
    userApiName = USER_OBJECT;
    currentUserId = CURRENT_USER_ID;
    user_id = USER_ID_FIELD;
    user_name = USER_NAME_FIELD;
    user_username = USER_USERNAME_FIELD;
}
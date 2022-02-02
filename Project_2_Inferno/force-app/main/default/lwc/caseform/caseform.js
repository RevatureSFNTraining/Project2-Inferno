import { LightningElement } from 'lwc';

export default class Caseform extends LightningElement {
    confirmation = '';  // Holds the random confirmation number.
    confirmNum= ''


    handleSubmit(event) {
        this.confirmation = 'Thank you for submitting your case to Jolly. Here is the confirmation number for your records.';
        this.confirmNum = Math.floor(Math.random() * 1000) + 9000;
    }
}
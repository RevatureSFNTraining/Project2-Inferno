// Israel Escobedo, 02/03/2022
import { LightningElement } from 'lwc';

export default class Caseform extends LightningElement {

    // Variables for confirmation messages.
    confirmation = '';  
    confirmNum= '';     // Holds the random confirmation number.   

    // Method that displays confirmation message and number.
    handleSubmit(event) {
        this.confirmation = 'Thank you for submitting your case to Jolly. Here is the confirmation number for your records.';
        this.confirmNum = Math.floor(Math.random() * 1000) + 9000;
    }
}
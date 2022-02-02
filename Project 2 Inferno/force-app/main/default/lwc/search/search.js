import { LightningElement } from 'lwc';

export default class Search extends LightningElement {
    search;

    handleSearchChange(event){
        this.search = event.detail.value;
    }
}
import { LightningElement } from 'lwc';

export default class Search extends LightningElement {
    search;
    searchresults;

    handleSearchChange(event){
        this.search = event.detail.value;
    }

    async handleSearch(event){
        await searchResults({text: this.search}).then(result => {this.searchresults = result;}).catch(error => {this.error = error;});
        if(!this.searchresults==null){
            this.dispatchEvent(new CustomEvent('search', {detail: this.searchresults}));
        }
    }
}
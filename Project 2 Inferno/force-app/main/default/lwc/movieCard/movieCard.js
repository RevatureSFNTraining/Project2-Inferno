import { LightningElement } from 'lwc';

export default class MovieCard extends LightningElement {
    title;
    videoURL;
    rating;
    movieId; //for passing to view page

    handleSelection(){
        //Publish Event: Movie Selection
        //Event Details: Movie ID
        const movieSelectionEvent = new CustomEvent('movieselection', { detail: this.movieId });
        this.dispatchEvent(movieSelectionEvent);
        //Move to View Content Page
    }
}
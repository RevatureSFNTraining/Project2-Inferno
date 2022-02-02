import { LightningElement } from 'lwc';

export default class MovieCard extends LightningElement {
    title;
    videoURL = "https://d2kektcjb0ajja.cloudfront.net/images/posts/feature_images/000/000/072/large-1466557422-feature.jpg?1466557422";
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
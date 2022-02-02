import { LightningElement } from 'lwc';

export default class MovieCard extends LightningElement {
    title;
    videoURL;
    rating;
    movieId; //for passing to view page

    handleClick(){
        //Pass Movie ID to viewContent
        //Move to View Content Page
    }
}
import { LightningElement, api } from 'lwc';

export default class ViewContent extends LightningElement {
    @api
    movieURL = "https://i.imgur.com/XuC2TWE.jpeg";

    playing = false;
    muted = false;

    togglePlay(){
        if(this.playing = true){
            this.playing = false;
        }
        else if (this.playing = false){
            this.playing = true;
        }
    }
    toggleMute(){
        if (this.muted = true){
            this.muted = false;
        }
        else if (this.muted = false){
            this.muted = true;
        }
    }

    //If Movie ID passed through event
    //Instead of accessed directly
    handleMovieSelection(){
        //Get Movie ID
        //Use Movie ID to match it with it's Streaming Content
        //Get the URL from the Streaming Content
    }
}
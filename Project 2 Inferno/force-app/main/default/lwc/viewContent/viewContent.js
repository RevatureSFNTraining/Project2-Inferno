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
}
import { LightningElement, wire } from 'lwc';
import getMovieList from '@salesforce/apex/StreamingContentHelper.getMovieList';
import getMovieSearchList from '@salesforce/apex/StreamingcontentHelper.getMovieSearchList';

export default class MovieReel extends LightningElement {
    genre;
    searchString;

    @wire (getMovieList)
    movies;
    reelMovieList;

    displayGenre(){
        this.reelMovieList = null;
        this.movies.forEach(movie => {
            if(movie.Genre__c == genre){
                if(this.reelMovieList.length < 6){
                    this.reelMovieList.add(movie);
                }
            }
        });
    }

    displaySearch(){
        this.reelMovieList = null;
        this.movies.forEach(movie => {
            //Check if title similar to searchString
            //Add movie to reelMovieList
            if(movie.Title__c.includes(this.searchString)){
                if (this.reelMovieList.length < 6){
                    this.reelMovieList.add(movie);
                }
            }
        });
    }
}
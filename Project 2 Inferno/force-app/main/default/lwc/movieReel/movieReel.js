import { LightningElement, wire } from 'lwc';
import getMovieList from '@salesforce/apex/StreamingContentHelper.getMovieList';

export default class MovieReel extends LightningElement {
    genre = 'Default Movie Genre';
    movieQuery;

    @wire (getMovieList)
    movies;
    reelMovieList;

    containsMovies(){
        if(this.movies != null){
            return true;
        }
        else{
            return false;
        }
    }

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
            //Check if title similar to movieQuery
            //Add movie to reelMovieList
            if(movie.Title__c.includes(this.movieQuery)){
                if (this.reelMovieList.length < 6){
                    this.reelMovieList.add(movie);
                }
            }
        });
    }
}
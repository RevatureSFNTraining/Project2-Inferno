import { LightningElement, wire } from 'lwc';
import getMovieList from '@salesforce/apex/StreamingContentHelper.getMovieList';
import getMovieSearchList from '@salesforce/apex/StreamingcontentHelper.getMovieSearchList';

export default class MovieReel extends LightningElement {
    genre;
    searchString;

    @wire (getMovieList)
    movies;

    @wire (getMovieSearchList)
    pickyMovies;
}
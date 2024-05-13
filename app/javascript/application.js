// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

document.addEventListener('DOMContentLoaded', () => {
    const randomAnimeLink = document.getElementById('random-anime-link');
    randomAnimeLink.addEventListener('click', () => {
      const randomIndex = Math.floor(Math.random() * 24 + 1);
      localStorage.setItem('randomAnimeIndex', randomIndex);
    });
  
   
    const savedRandomIndex = localStorage.getItem('randomAnimeIndex');
    if (savedRandomIndex !== null) {
      localStorage.removeItem('randomAnimeIndex'); 
      const randomUrl = `/animes/${savedRandomIndex}`;
      window.location.href = randomUrl;
    }
  });
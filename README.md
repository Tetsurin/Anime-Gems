# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

To run docker:
`docker build -t anime_gems . `
`docker run -d -p 3000:3000 -v C:\Users\Naty\Desktop\vlad\Anime-Gems:/app anime_gems`

or with "$(pwd)
`docker run -d -p 3000:3000 -v "$(pwd)":/app anime_gems`

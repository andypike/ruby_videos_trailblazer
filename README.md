Ruby Videos
===========

[![Codeship Status for andypike/ruby_videos](https://codeship.com/projects/e7d9ad60-681f-0132-46be-42331d97e8e9/status?branch=master)](https://codeship.com/projects/53264)
[![Code Climate](https://codeclimate.com/github/andypike/ruby_videos/badges/gpa.svg)](https://codeclimate.com/github/andypike/ruby_videos)
[![Test Coverage](https://codeclimate.com/github/andypike/ruby_videos/badges/coverage.svg)](https://codeclimate.com/github/andypike/ruby_videos)

A curated listing of quality videos about or related to the Ruby programming
language.

Setup
-----

```
brew install imagemagick
git clone git@github.com:andypike/ruby_videos.git
cd ruby_videos
cp config/example.database.yml config/database.yml
cp example.env .env
  * Add your development details to .env
psql postgres
# create user ruby_videos with password '' CREATEDB;
# \q
bundle
rake db:create db:migrate db:seed
rake db:create db:migrate RAILS_ENV=test
rails s
```

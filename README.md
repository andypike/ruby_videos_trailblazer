Ruby Videos with Trailblazer
============================

[![Codeship Status for andypike/ruby_videos_trailblazer](https://codeship.com/projects/10af0f20-8581-0132-2483-0acf1572ff7a/status?branch=master)](https://codeship.com/projects/58760)
[![Code Climate](https://codeclimate.com/github/andypike/ruby_videos_trailblazer/badges/gpa.svg)](https://codeclimate.com/github/andypike/ruby_videos_trailblazer)
[![Test Coverage](https://codeclimate.com/github/andypike/ruby_videos_trailblazer/badges/coverage.svg)](https://codeclimate.com/github/andypike/ruby_videos_trailblazer)

A curated listing of quality videos about or related to the Ruby programming
language.

Setup
-----

```
brew install imagemagick
git clone git@github.com:andypike/ruby_videos_trailblazer.git
cd ruby_videos_trailblazer
cp config/example.database.yml config/database.yml
cp example.env .env
  * Add your development details to .env
psql postgres
# create user ruby_videos_trailblazer with password '' CREATEDB;
# \q
bundle
rake db:create db:migrate db:seed
rake db:create db:migrate RAILS_ENV=test
rails s
```

Why?
----

I wanted to experiment with [Trailblazer](https://github.com/apotonick/trailblazer) so this project allows me to try things out.

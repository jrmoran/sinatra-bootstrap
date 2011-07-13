Sinatra bootstrap to build single page apps with CoffeeScript, Haml and
Sass (Compass & BlueprintCSS) on Heroku.

## Sinatra Helpers

* `css_v`     adds a timestamp to `.css`    files in `./public`
* `js_v`      adds a timestamp to `.js`     files in `./public`
* `sass_v`    adds a timestamp to `.sass`   files in `./views/`
* `coffee_v`  adds a timestamp to `.coffee` files in `./views/`

## Tasks

* Document Ruby, CoffeeScript and JavaScript files with docco
* Minify and concatenate JavaScript files with YUI-Compressor

## JavaScript Libraries

* jQuery 1.6.1
* Underscore.js 1.1.6
* Backbone.js 0.5.0

## Dependencies

Read the `Gemfile` and run `bundle install`

The `doc` task requires `docco` install it by running 

    sudo npm install docco

This requires having Node.js installed.

## Notes
This bootstrap includes a model skeleton for DataMapper. While in
development a sqlite3 database will be used, but under production
Datamapper will switch to PostgreSQL (This assumes deployment on Heroku).

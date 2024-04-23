# A simple test for my Rails 7.1 quickstart template

This is a Ruby on Rails application with a simple CRUD interface for an
article-like model.

It was created using the "base" template from [my Rails quickstart
repository](https://github.com/riccardo-giomi/rails-7.1-quickstart), and the
expanded scaffolding generators it provides.

It is a simple application intended to try out and possibly showcase the
features of that quickstart project.

## Prerequisites

These are the Ruby and Bundler versions the application was bundled with, more
recent versions should also work:

- Ruby 3.2.2
- Bundler 2.4.22

You will also need *[SQLite3](https://www.sqlite.org/)* and *libvips* (see
[here](https://github.com/libvips/ruby-vips) for more information).

## Installation

The following commands will download the app's code, download or update the
required Ruby Gems, and prepare a database for the application.

``` bash
git clone https://github.com/riccardo-giomi/rails-articles
cd rails-articles
bundle
bin/rails db:prepare
```

There's an example Article that can be seeded in the database if you want:
``` bash
bin/rails db:seed
```
It includes an example image that you can find in `public/example.image.jpg`,
generated with [Lorem Picsum](https://picsum.photos).


You can run the specs with:
``` bash
bundle exec rspec
```

And start the server with:
``` bash
bin/dev
```

The application will be available to a browser at `http://localhost:3000`.

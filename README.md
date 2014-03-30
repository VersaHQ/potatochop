# Potatochop

Impetus: [Because F$%k Photoshop](http://2012.jsconf.eu/speaker/2012/08/29/because-f-k-photoshop.html)

## Installation

Install Potatochop as a gem in the usual ways:

Add this line to your application's Gemfile:

    gem 'potatochop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install potatochop


## Usage

To use Potatochop, you also need a folder where you keep your mock ups. Ideally this folder would be under version control, but it is not required.

Once the Potatochop gem is installed, cd into your comps directory and run `potatochop`.

```
$ cd comps_repo
$ potatochop
```

This will start up the Potatochop server on port 4567. By default, Potatochop will serve files in the same heirarchy as the mock ups folder.

## The Mock Ups folder

For lack of a better name, the folder where you store your haml, sass, js, etc. files is called the mock ups folder.

With the default configuration, Potatochop processes and serves any haml or sass file in this folder. Html & javascript files are served directly.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

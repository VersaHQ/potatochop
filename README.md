# Potatochop
_A simple server for HTML & SASS mock ups_

[VersaHQ blog post on Potatochop](http://blog.versahq.com/post/82290792427/potatochop)

## Installation

Install Potatochop as a gem in the usual way:

    $ gem install potatochop


## Usage

To use Potatochop, you also need a folder where you keep your mock ups. Ideally this folder would be under version control, but it is not required.

Once the Potatochop gem is installed, cd into your comps directory and run `potatochop`.

```
$ cd ~/mock_ups # or wherever you keep your mock_ups
$ potatochop
```
or pass in the path to your mock ups folder

```
$ potatochop ~/mock_ups
```

This will start up the Potatochop server on port 4567. By default, Potatochop will serve files in the same hierarchy as the mock ups folder.

For example, if you start Potatochop in a folder with a file called `new_homepage.html.haml` you can see it in your browser at `http://localhost:4567/new_homepage.html`

## The Mock Ups folder

For lack of a better name, the folder where you store your haml, sass, js, etc. files is called the mock ups folder.

Out of the box, Potatochop processes and serves any haml or sass file in this folder. Vanilla HTML & JavaScript files are served directly. For example, your mock ups folder could be organized like this:

```
~/mock_ups
	about.html
	faq.html.haml
	index.html.haml
	css/
		about.css
		faq.css.scss
		index.css.scss
	js/
		interactions.js
```

When you want to include stylesheets in your haml/html pages, refer to them only by their `.css` extension. Using the above folder layout:

```
 # index.html.haml
 %link{ rel: 'stylesheet', href: 'css/index.css' }
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
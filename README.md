# middleman-page-toc

An extension to Middleman which provides a helper method to render table of contents of the specified page/resource.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-page-toc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-page-toc

## Settings

Use **redcarpet** as markdown engine and enable :toc_data option. and then activate this extension:

```ruby
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :autolink => true,
  :smartypants => true, :tables => true, :with_toc_data => true

activate :page_toc
```

## Usage

use **render_toc()** helper function on your layouts or page.

```ruby
<%= render_toc(current_page) %>
```

### options

- :use_collapsing
- :button_caption
- :expand

You must setup **twitter-bootstrap** css/js on your environment to use collapsing.

## Contributing

1. Fork it ( https://github.com/atarukoddaka/middleman-page-toc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

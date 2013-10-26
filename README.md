# BasePresenter

[![Gem Version](https://badge.fury.io/rb/base_presenter.png)](http://badge.fury.io/rb/base_presenter)

The gem adds "Presenter" functionality into Rails application.

# Installation

Add this line to your application's Gemfile:

    gem 'base_presenter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install base_presenter

# Getting Started

## First step

Usa a generator

    rails g base_presenter:install [model_name]

## Second step

For model_name equal 'example' we should get file in director root_rails/app/presenters/example_presenter.rb which we can improve.
For example:

```ruby
class ExamplePresenter < ApplicationPresenter
  presents :example
  delegate :id, to: :example

  def name
    "Name"
  end

  def self.class_name
    "Example"
  end

  def link_to_example
    handle_none example.name do
      link_to(example.name, example_path(example))
    end
  end

end
```

and in file show.html.erb with:
* object `@example`

```erb
<% present @example do |presenter| %>
  Id: <%= presenter.id %>
  Name: <%= presenter.name %>
  Url: <%= presenter.link_to_example %>
<% end %>
```

* class `Example`

```erb
<% present Example do |presenter| %>
  Class name: <%= presenter.class_name %>
<% end %>
```

## Methods

Methods of BasePresenter

Method returns span with 'None given' when value is blank
```erb
#handle_none(value)
```

# BasePresenter

The gem adds "Presenter" functionality into Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'base_presenter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install base_presenter

## Usage

In director root_rails/app/presenters create file example_presenter.rb with content

    class ExamplePresenter < BasePresenter
      presents :example
      delegate :name, :example

      def name
        "Name"
      end

      def self.class_name
        "Example"
      end
    end

and in file show.html.erb with:
* object @example

    <% present @example do |presenter| %>
      Name: <%= presenter.name %>
    <% end %>

* class Example

    <% present Example do |presenter| %>
      Class name: <%= presenter.class_name %>
    <% end %>

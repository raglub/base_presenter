require "base_presenter/version"
require "application_helper"

class BasePresenter

  def initialize(object, template)
    @object = object
    @template = template
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  # Return span with 'None given' when value is blank
  def handle_none(value)
    if value.present?
      yield
    else
      content_tag :span, "None given", class: "none"
    end
  end

  class << self
    attr_accessor :template

    def presents(name)
      define_method(name) do
        @object
      end
    end

    def method_missing(*args, &block)
      @@template.send(*args, &block)
    end

  end

end

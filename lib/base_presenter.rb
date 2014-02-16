require "base_presenter/version"
require "base_presenter/application_helper"

class BasePresenter

  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.initialize(object, template)
    @@object = object
    @@template = template
  end

  private

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  def self.method_missing(*args, &block)
    @@template.send(*args, &block)
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  # Return span with 'None given' when value is blank
  def handle_none(value)
    if value.present?
      yield
    else
      content_tag :span, "None given", class: "none"
    end
  end

end

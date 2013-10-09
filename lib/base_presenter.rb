require "base_presenter/version"
require "application_helper"
class BasePresenter

  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  def handle_none(value)
    if value.present?
      yield
    else
      @template.content_tag :span, "None given", class: "none"  
    end
  end
end

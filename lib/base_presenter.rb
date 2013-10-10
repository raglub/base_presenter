require "base_presenter/version"
require "application_helper"
class BasePresenter

  def initialize(object, template)
    @object = object
    @template = template
  end

  def method_missing(*args, &block)
    h.send(*args, &block)
  end

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"  
    end
  end

  class << self
    attr_accessor :template

    def presents(name)
      define_method(name) do
        @object
      end
    end
  end

  private

    def self.h
      @@template
    end

    def h
      @template
    end
end

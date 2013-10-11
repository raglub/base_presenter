module ApplicationHelper
  def present(object_or_class, klass = nil)
    presenter = nil

    if object_or_class.methods.include?(:new)
      klass ||= "#{object_or_class}Presenter".constantize
      presenter = klass
      presenter.template = self
    else
      klass ||= "#{object_or_class.class}Presenter".constantize
      presenter = klass.new(object_or_class, self)
    end

    yield presenter if block_given?
    #block.arity > 0 ? yield(presenter) : presenter.instance_eval(&block)
    return presenter
  end
end

module BasePresenter::ApplicationHelper
  def present(object_or_class, klass = nil, &block)
    presenter = nil

    if object_or_class.methods.include?(:new)
      klass ||= "#{object_or_class}Presenter".constantize
      presenter = klass
      presenter.initialize(object_or_class, self)
    else
      klass ||= "#{object_or_class.class}Presenter".constantize
      presenter = klass.new(object_or_class, self)
    end

    if block_given?
      block.arity > 0 ? yield(presenter) : presenter.instance_eval(&block)
    end

    return presenter
  end
end

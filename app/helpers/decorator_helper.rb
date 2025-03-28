module DecoratorHelper
  def decorate(model_name, view_context = nil, decorator_class = nil)
    (decorator_class || "#{model_name.class}Decorator".constantize).new(model_name, view_context)
  end
end

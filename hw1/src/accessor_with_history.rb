class Module
  def attr_accessor_with_history(method_name)
    method_name = method_name.to_s
    attr_reader method_name

    attr_writer_with_history method_name

    attr_history_reader(method_name)
  end

  private

  def attr_history_reader(method_name)
    define_method (method_name + "_history").to_sym do
      history = instance_variable_get("@" + method_name + "_history")
      return history unless history == nil
      []
    end
  end

  def attr_writer_with_history(method_name)
    define_method "#{method_name}=".to_sym do |new_value|
      old_history = instance_variable_get("@#{method_name}_history")

      unless old_history != nil
        old_history = [nil]
      end

      old_history.append(new_value)

      instance_variable_set "@#{method_name}_history", old_history
      instance_variable_set "@#{method_name}".to_sym, new_value
    end
  end
end

class Foo
  attr_accessor_with_history :bar
end

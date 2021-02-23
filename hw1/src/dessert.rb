class Dessert

  # @param [String] name
  # @param [Numeric] calories
  def initialize(name, calories)
    @calories = calories
    @name = name
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end

  def name
    @name
  end

  def name=(name)
    @name=name
  end

  def calories
    @calories
  end

  def calories=(calories)
    @calories=calories
  end
end
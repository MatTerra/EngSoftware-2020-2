require_relative './dessert'

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    @flavor != "black licorine"
  end

  def flavor
    @flavor
  end

  def flavor=(flavor)
    @flavor=flavor
  end
end
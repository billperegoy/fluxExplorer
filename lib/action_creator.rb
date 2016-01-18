class ActionCreator
  attr_reader :actions

  def initialize
    @actions = []
  end

  def create(action)
    @actions << action
  end

  def read
    @actions.shift
  end
end

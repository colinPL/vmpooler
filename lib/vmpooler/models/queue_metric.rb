class QueueMetric
  attr_accessor :pending, :cloning, :booting, :ready, :running, :completed, :total

  def initialize
    @pending = 0
    @cloning = 0
    @booting = 0
    @ready = 0
    @running = 0
    @completed = 0
    @total = 0
  end

  def [](k)
    self.instance_variable_get("@#{k.to_s}")
  end

  def []=(k, v)
    self.instance_variable_set("@#{k.to_s}", v)
  end

  def to_json(v)
    {
        pending: @pending.to_i,
        cloning: @cloning.to_i,
        booting: @booting.to_i,
        ready: @ready.to_i,
        running: @running.to_i,
        completed: @completed.to_i,
        total: @total.to_i
    }.to_json(v)
  end

end
class PoolStats
  attr_accessor :name, :duration, :count

  def initialize(name, durations=[])
    @name = name.to_s
    @duration = TaskDuration.new
    @count = {
        total: 0
    }
    @durations = []
    parse(durations)
  end

  def parse(durations)
    if durations.is_a?(Array) && durations.length > 0
      @count[:total] = durations.length
      @duration.parse(durations)
    end
  end

  def [](k)
    self.instance_variable_get("@#{k.to_s}")
  end

  def to_json(v)
    {
        duration: @duration,
        count: @count
    }.to_json(v)
  end

end
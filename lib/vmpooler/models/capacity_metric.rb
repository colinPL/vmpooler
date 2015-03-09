class CapacityMetric
  attr_accessor :current, :total, :percent

  def initialize
    @current = 0
    @total = 0
    @percent = 0
  end

  def [](k)
    self.instance_variable_get("@#{k.to_s}")
  end

  def []=(k, v)
    self.instance_variable_set("@#{k.to_s}", v)
  end

  def calc_average
    if @total > 0
      @percent = ((@current.to_f / @total.to_f) * 100.0).round(1)
    end
  end

  def to_json(v)
    {
        current: @current.to_i,
        total: @total.to_i,
        percent: @percent
    }.to_json(v)
  end
end
class TaskDuration
  attr_accessor :average, :min, :max, :total, :pool

  def initialize(include_pool=false)
    @total = 0
    @average = 0
    @min = 0
    @max = 0
    @durations = []
    @pool = {}
    @pool_include = include_pool
  end

  def add(val)
    @durations.push(val.to_i) unless val.nil?
  end

  def parse(durations)
    if durations.is_a?(Array) && durations.length > 0
      @total = durations.reduce(:+).to_f
      @average = (@total / durations.length).round(1)
      @min, @max = durations.minmax
    end
  end

  def add_pool
    @pool_include = true
  end

  def [](k)
    self.instance_variable_get("@#{k.to_s}")
  end

  def []=(k, v)
    self.instance_variable_set("@#{k.to_s}", v)
  end

  def to_json(v)
    json = {
        average: @average,
        min: @min,
        max: @max,
        total: @total
    }

    json[:pool] = @pool if @pool_include
    json.to_json(v)
  end

end
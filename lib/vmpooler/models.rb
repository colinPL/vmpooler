%w( task_duration pool_stats queue_metric capacity_metric ).each do |lib|
  begin
    require "models/#{lib}"
  rescue LoadError
    require File.expand_path(File.join(File.dirname(__FILE__), 'models', lib))
  end
end

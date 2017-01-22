Dir[Rails.root.join('app/controllers/*_controller.rb')].map do |path|
  path.match(/(\w+)_controller.rb/)
  $1
end.compact.each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.js.coffee", "#{controller}.css"]
end

Dir[Rails.root.join('app/controllers/customers/*_controller.rb')].map do |path|
  path.match(/(\w+)_controller.rb/)
  $1
end.compact.each do |controller|
  Rails.application.config.assets.precompile += ["customers/#{controller}.js", "customers/#{controller}.js.coffee", "customers/#{controller}.css"]
end

Rails.application.config.assets.precompile += %w( jquery.timeago.js )
Rails.application.config.assets.precompile += %w( jquery.Jcrop.css )

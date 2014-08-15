Sequel::Model.plugin(:schema)
Sequel::Model.plugin(:timestamps)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("jdbc:postgresql://localhost/wafelijzer_development", :loggers => [logger])
  when :production  then Sequel.connect("jdbc:" + ENV['DATABASE_URL'],  :loggers => [logger])
  when :test        then Sequel.connect("jdbc:postgresql://localhost/wafelijzer_test",        :loggers => [logger])
end

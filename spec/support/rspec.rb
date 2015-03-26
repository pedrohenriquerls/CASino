RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.orm = "mongoid"
  end
  config.before(:each) do
    DatabaseCleaner.start

    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

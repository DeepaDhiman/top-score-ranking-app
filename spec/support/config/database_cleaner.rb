# Ref: https://medium.com/better-programming/how-to-set-up-rails-with-rspec-capybara-and-database-cleaner-aacb000070ef
#
# By default, RSpec will take care of cleaning the database, running every test
# with a database transaction and then rolling back that transaction after it
# finishes.
#
# There are a few quirks to catch you off-guard, however:
#
# - Data created within an RSpec before(:each) Hook does get rolled back after
# each test — great.
# - Data created within a before(:all) Hook does not get rolled
# back. Unless you manually handle it, that data may start interfering with other
# tests in the suite.
# - If you’re using Capybara with the :js option to test with
# Selenium or WebKit, RSpec’s transactional cleaner simply won’t work.
RSpec.configure do |config|
  config.before(:suite) do
    # This instructs RSpec to use database_cleaner to “truncate” the database
    # before every test suite — it empties every table entirely. This is a
    # brute-force approach to database cleaning but for personal projects, it
    # will serve just fine.
    # If you’re using Active Record, the except statement is essential. Without it,
    # the database_cleaner will destroy Active Record’s environment data,
    # resulting in a NoEnvironmentInSchemaError every time your tests run.
    DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)
  end

  # Here, we set the database_cleaner strategy to transaction, which means
  # every test will create a database transaction that will simply be rolled
  # back when it ends, as if it never happened.
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # DatabaseCleaner.start and DatabaseCleaner.end are simply the triggers to
  # start the cleaning process before and after each test.
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
require 'active_record/fixtures'
class AddInitialAdmin < ActiveRecord::Migration
  def change
    directory = File.join(File.dirname(__FILE__), "init_data")
    ActiveRecord::FixtureSet.create_fixtures(directory, "users")
  end
end

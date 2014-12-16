$:<< File.expand_path('../../lib', __FILE__)

# dependencies
require 'rails'
require 'global_id'
require 'devise'
require 'devise-async'
require 'active_job/base'

# gem
require 'devise/async/backend/active_job'

# test framework
require 'rspec'

# fake model to be serialized/reloaded
require 'sqlite3'
require 'active_record'
class User < ActiveRecord::Base; end

# DB w/ schema in memory
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.timestamps
  end
end

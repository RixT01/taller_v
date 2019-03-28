require "active_record"
require 'pg'

ActiveRecord::Base.establish_connection({
  adapter:  "postgresql",
  host:     "localhost",
  username: "dan",
  database: "taller_v",
  password: ""}
)

class Inventory < ActiveRecord::Base
end

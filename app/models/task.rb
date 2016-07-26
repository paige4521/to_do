require "active_record"


class Task < ActiveRecord::Base
belongs_to :list

end

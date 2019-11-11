class User < ApplicationRecord
    has_many :tasks
    has_many :lists, through: :tasks
end

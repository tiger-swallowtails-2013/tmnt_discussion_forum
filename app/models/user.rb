class User < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :email, presence: true
    validates :username, presence: true

    def self.authenticate(hash)
      find(:first, :conditions => ["username = ? AND password = ?",
                                   hash[:username], hash[:password]])
    end
end

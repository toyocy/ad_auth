class User < ApplicationRecord
  devise :ldap_authenticatable, :rememberable, :trackable
end

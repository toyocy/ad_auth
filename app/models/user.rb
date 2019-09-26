class User < ApplicationRecord
  before_save :get_last_name, :get_first_name, :get_phone_number, :get_title, :get_mail, :get_emplpyee_number
  devise :ldap_authenticatable, :rememberable, :trackable

  private

  def get_last_name
    last_name = Devise::LDAP::Adapter.get_ldap_param(username, 'sn')
    self.last_name = last_name.first.force_encoding('UTF-8') unless last_name.nil?
  end

  def get_first_name
    first_name = Devise::LDAP::Adapter.get_ldap_param(username, 'givenName')
    self.first_name = first_name.first.force_encoding('UTF-8') unless first_name.nil?
  end

  def get_phone_number
    phone_number = Devise::LDAP::Adapter.get_ldap_param(username, 'telephoneNumber')
    self.phone_number = phone_number.first.to_s unless phone_number.nil?
  end

  def get_title
    title = Devise::LDAP::Adapter.get_ldap_param(username, 'title')
    self.title = title.first.force_encoding('UTF-8') unless title.nil?
  end

  def get_mail
    mail = Devise::LDAP::Adapter.get_ldap_param(username, 'mail')
    self.mail = mail.first.to_s unless mail.nil?
  end

  def get_emplpyee_number
    employee_number = Devise::LDAP::Adapter.get_ldap_param(username, 'employeeID')
    self.employee_number = employee_number.first.to_s unless employee_number.nil?
  end
end

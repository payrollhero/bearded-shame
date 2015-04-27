# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

users = [
  {email: "testadmin@example.com", password: "testadminuser", password_confirmation: "testadminuser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {email: "testuser@example.com", password: "testuseraccount", password_confirmation: "testuseraccount", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {email: "testcustomer@cexample.com", password: "testcustomeruser", password_confirmation: "testcustomeruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
]
User.create!(users)



types = [
  {name: 'Standard'},
  {name: 'Extended'},
  {name: 'Courtesan'}
]
MassageType.create(types)


items = [
  {name: 'Shave', cost: '100'},
  {name: 'Trim', cost: '50'},
  {name: 'Trim with massage', cost: '75'}
]
Price.create(items)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all

User.create(
    username: 'lexevan',
    first_name: 'lex',
    last_name: 'evan',
    email: 'lexevan@gmail.com',
    password: 'testtest',
    password_confirmation: 'testtest',
    confirmed_at: "2015-05-07 14:56:59"
  )

User.create(
    username: 'brooks',
    first_name: 'brooks',
    last_name: 'swinnerton',
    email: 'bswin@designsqr.com',
    password: 'testtest',
    password_confirmation: 'testtest'
  )

User.create(
    username: 'sgriffis',
    first_name: 'sarah',
    last_name: 'griffis',
    email: 'sgriffis@designsqr.com',
    password: 'testtest',
    password_confirmation: 'testtest'
  )
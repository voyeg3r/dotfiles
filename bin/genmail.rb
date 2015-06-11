#!/usr/bin/env ruby
# generate random names

require 'faker'
name = [Faker::Name.first_name, Faker::Name.first_name].join(" ")
puts [name, Faker::Internet.email(name)].join(" ")

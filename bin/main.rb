# !/usr/bin/env ruby

require 'csv'
require_relative '../lib/tastee.rb'

new_csv = CSV.open('csv_output/Tastee.csv', 'a+')
new_csv << %w[area address delivery_schedule]

tastee = Tastee.new

tastee.scrape(new_csv)

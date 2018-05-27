# coding: utf-8
require './web.rb'
require './timetable.rb'

$tt = TimeTable.new('./timetable.tsv')

Web.run!

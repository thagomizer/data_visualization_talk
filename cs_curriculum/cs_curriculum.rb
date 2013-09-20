#!/usr/bin/ruby -w
require 'rubygems'
require 'graph'
require 'nokogiri'
require 'open-uri'

uri     = "http://www.cs.hmc.edu/program/course-descriptions/"
doc     = Nokogiri::HTML(open(uri))

def normalize(number)
  number.strip.gsub(/\s/, '')
end

courses = []

course_descriptions = doc.css(".crsdscrptn-header")

course_descriptions.each do |description|
  course = Hash.new

  number, title = description.css(".crsdscrptn-title").text.split('.')

  course[:number] = normalize(number)
  course[:title]  = title.strip

  desc = description.css("dl dd")[0].text
  pre_reqs = desc.scan(/CS\s*\d+/)
  course[:pre_reqs] = pre_reqs.map { |s| normalize(s) }

  courses << course
end

digraph do
  rotate; boxes;

  courses.each do |course|
    node(course[:number]).label course[:title]
  end

  courses.each do |course|
    course[:pre_reqs].each do |pr|
      edge pr , course[:number]
    end
  end

  orphans = nodes.map { |_, n| n.orphan? ? n.name : nil}
  orphans.each { |name| delete_node(name) }

  save "hmc_cs", "png"
end

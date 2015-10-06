#!/usr/bin/env ruby -w
require 'active_support/all'

#This script generates a blog post template, it does the following things:
#1. create the markdown file under _posts/ dir
#2. fill in the front matter stuff

if(ARGV.length !=2)
  puts "Wrong number of arguments"
  puts "Usage: ruby #{__FILE__} filename title"
  exit(1)
end

date = Date.today.to_s
file_name = "#{date}-#{ARGV[0].downcase.gsub(' ', '-')}.markdown"
front_matter = %{---
layout: post
title:  "#{ARGV[1]}"
date:   #{Time.now.strftime("%Y-%m-%d %H:%M")}
comments: true
---}
path = "_posts/#{file_name}"
File.write("#{path}", front_matter)
`atom #{path}`
puts file_name, front_matter

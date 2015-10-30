#!/usr/bin/env ruby -w
Dir.glob("*").each do |file|
  if file.include?('.jpeg')
    new_name = file.gsub('.jpeg', '.jpg')
    File.rename(file, new_name)
  end
end

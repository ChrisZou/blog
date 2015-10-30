#!/usr/bin/env ruby -w
Dir.glob("*").each do |file|
  if file.include?('tiff')
    new_name = file.gsub('.tiff', '.jpg')
    File.rename(file, new_name)
  end
end

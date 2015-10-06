---
layout: post
title:  "Ruby 文件操作 Cheatsheet"
date:   2015-10-06 15:51
comments: true
---
Ruby file操作cheatsheet
每次都要查，真是蛋疼，不如一次性总结一下，以后再不记得就来这里找好了。
filename = ‘testfile.txt’

1. 读取其中的全部内容：File.read(filename)
2. 将一个字符串一次性写入这个文件：
File.write(filename, str)
3. 读取文件内容，以此处理其中的每一行：
File.foreach(filename) do |line|
    #process each line
end
4. 判断文件是否存在：File.exists?(filename)
5. 删除文件：File.delete(filename)
6. 文件重命名：File.rename(filename, new_name)
7. 文件的名字：file.path  # file是一个File对象
8. 文件的绝对路径：File.absolute_path(filename)
9. 当前所在目录：Dir.pwd
10. 当前登录用户的home目录：Dir.home
11. 当前文件（正在执行的文件）相对于当前所在目录（pwd目录）的相对路径：__FILE__
12. 当前文件（正在执行的文件）的目录相对于当前所在目录（pwd目录）的相对路径：File.dirname(__FILE__)
13. 当前文件（正在执行的文件）的绝对路径：File.expand_path(__FILE__)
14. 当前文件（正在执行的文件）所在目录的绝对路径：File.expand_path(File.dirname(__FILE__))

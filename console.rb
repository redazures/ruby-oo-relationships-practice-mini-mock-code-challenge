require 'pry'
require_relative './book'
require_relative './author'
require_relative './authored'

# #Authors
yas=Author.new("Yaz Jules")
ben=Author.new("Ben Su")
kry=Author.new("Krystal Wong")
kev=Author.new("Kev Thompson")

#**************Adjusted Books for Many to Many******************
dungeons=Book.new("dungeons",1279)
kyle=Book.new("kyle",435)
bball=Book.new("mj",169)
krystal=Book.new("krystal",746)
# james=ben.write_book("james",342)
dungeons_a=Authored.new(dungeons,yas)
kyle_a=Authored.new(kyle,ben)
kyle_a=Authored.new(kyle,kry)
bball_a=Authored.new(bball,kev)
krystal_a=Authored.new(krystal,ben)

#^^^^^^^^^^^^^^Adjusted Books for Many to Many^^^^^^^^^^^^^^^^^^


binding.pry



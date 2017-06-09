################################################
#                                              #
#                DRAGONS BANE                  #
#                   V 1.0                      #
#                                              #
################################################


require './DF_Methods' #Contains Combat Logic
load 'DF_Char.rb' #Contains Character
load 'DF_Monsters.rb' #Creates a Random Monster
load 'DF_Items.rb' #Selects an Item at random

#Intro game

#Get info from user (name,class,gender)

#Begin story
puts
puts
puts
puts "Welcome to Dragons Bane!"
puts
puts
print "What is your Name?: "
char_name = gets.chomp
puts
print "Please Select a Class: (S)oldier - (R)anger - (T)hief - (M)age: "
job_select = gets.chomp.upcase
puts
puts "You have selected #{job_select}!"
puts
character = Character.new(char_name, job_select, "M")
#---------------------------------------------------#
puts
puts "Let's have a look at your character sheet..."
puts
character.to_s
combat(character)
puts
puts

combat(character)
puts

character.to_s


#puts character.inventory[0].strength

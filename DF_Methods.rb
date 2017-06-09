#Need to make a way to create a non-random Monster
#In certain instances. I may need to create seperate
#Methods for each specific encounter.

#Explore Options

def combat(char)

  mon = Monster.new(char)
  #char_health = character.stats[:health] -= rand(mon.mon_stats[:mon_attack])

  puts
  puts "A Wild #{mon.mon_stats[:name]} appears!"
  puts
  puts "Monster Level: #{mon.mon_level}"
  puts
  puts "Your health: #{char.stats[:health]}"
  puts
  puts "Monster health: #{mon.mon_stats[:health]}"
  puts
  print "Will you (a)ttack or (f)lee?: "
  resp_1 = gets.chomp.downcase
  puts
  puts
  #Combat Loop
  case resp_1
  when "a"
    attack_again = "y"
  when "f"
    puts
    puts "Later loser!"
    puts
    exit!
  end
  puts
  puts ")(<{}>)(------------------------------------------)(<{}>)("
  puts
  # Begin Combat Loop
  while attack_again == "y"
    char.attack #resets random char attack
    mon.attack #and mon attack
    if char.hit_check > mon.mon_stats[:armor]
      puts
      puts "You hit the #{mon.mon_stats[:name]} for: #{char.my_attack} dmg"
      mon.mon_stats[:health] -= char.my_attack
      puts
      puts "Monster Health: #{mon.mon_stats[:health]}"
      puts
      ###
      case mon.mon_stats[:health]
      when -20..0
        #
        puts
        puts ")(<{}>)(------------------------------------------)(<{}>)("
        puts
        puts "You have slain the monster!"
        puts
        puts "You receive #{mon.mon_exp} experience points!!"
        puts
        char.level_up(mon.mon_exp)
        puts
        puts ")(<{}>)(------------------------------------------)(<{}>)("
        puts
        print "You receive: "
        puts "#{mon.loot_list.to_s}"
        char.inventory.push(mon.loot_list.item)
        puts
        print "Your Inventory: "
        char.inventory.each {|item| print "#{item.item_name} - "}
        puts
        puts
        break
      end
    else
      puts
      puts "You Miss!"
      puts
    end
    if mon.hit_check > char.stats[:armor]
      puts
      puts "The monster hits!"
      puts
      puts "The #{mon.mon_stats[:name]} hits you for: #{mon.my_attack} dmg!!"
      char.stats[:health] -= mon.my_attack
      puts
      puts "Your health is: #{char.stats[:health]}"
      puts
      case char.stats[:health]
      when -20..0
        #
      end
    else
      puts
      puts "The #{mon.mon_stats[:name]} misses!"
      puts
    end
    print "Will you attack again? (a)ttack or (f)lee?: "
    player_response_2 = gets.chomp.downcase
    puts
    puts
    puts ")(<{}>)(------------------------------------------)(<{}>)("
    puts
    case player_response_2
    when "a"
      attack_again = "y"
    when "f"
      attack_again = "f"
      puts
      puts "Later Loser!"
      puts
    end
  end
end

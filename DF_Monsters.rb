class Monster
  attr_reader :mon_stats, :mon_exp, :my_attack, :loot_list, :hit_check, :mon_level

  def initialize(char)
    #Give monster a loot table
    @mon_level = char.level #monster will be same lvl as char
    @loot_list = LootTable_1.new
    #Create array of monsters to select from a random roll
    mon_list = ["dragon", "wolf", "kobold", "spider", "goblin", "blue_slime"]
    #Generate a random int based on length of mon_list
    num = rand(mon_list.length)
    #Call roll_stats on randomly selected monster
    roll_stats(mon_list.at(num))
    @mon_exp = @mon_stats[:level] * 100
  end

  def roll_stats(mon)
    #Accept arguement mon = the name of the monster
    #Define Stats for level 1 monster
    lvl_1 = {strength: 15, stamina: 20, dexterity: 10, wisdom: 15, armor: 3, health: 20, level: 1}
    lvl_2 = {strength: 16, stamina: 22, dexterity: 10, wisdom: 15, armor: 4, health: 22, level: 2}
    case mon
    #assign stats/name based on value of mon
    when "dragon"
      @mon_stats  =  lvl_1
      self.mon_stats[:name] = "Dragon"
    when "wolf"
      @mon_stats  =  lvl_1
      self.mon_stats[:name] = "Wolf"
    when "kobold"
      @mon_stats  =  lvl_1
      self.mon_stats[:name] = "Kobold"
    when "spider"
      @mon_stats  =  lvl_1
      self.mon_stats[:name] = "Spider"
    when "goblin"
      @mon_stats  =  lvl_1
      self.mon_stats[:name] = "Goblin"
    when "blue_slime"
      @mon_stats  =  lvl_1
      self.mon_stats[:name] = "Blue Slime"
    end
  end

  def attack
    #contains attack logic based on random rolls
    #which are influenced by character stats
    @hit_check = 1 + rand(20)
    @my_attack = 1 + rand(self.mon_stats[:strength]/2)
  end

  def to_s
    #Prints monster vitals
    puts
    puts "Monster Name : #{self.mon_stats[:name]}"
    puts
    puts "Monster Level : #{self.mon_stats[:level]}"
    puts
  end

end

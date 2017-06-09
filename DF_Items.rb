#This file contains a class LootTable_1 whose initialize
#method selects a random item that is also a class
#When this class is called it gives access to a random
#item which can be given to an enemy or the character or both


class LootTable_1
  attr_reader :ShortSword, :item, :OakShield, :to_s, :roll_item, :ForestCloak
  attr_writer :item

  def initialize
    #Select a random Item by rolling a random number
    #Whose max value is the total number of items
    @roll_item = 1 + rand(3)
    #Instantiate the new item  as selected by the roll
    case @roll_item
    when 1
      @item = ShortSword.new
      #return @item
    when 2
      @item = OakShield.new
      #return @item
    when 3
      @item = ForestCloak.new
      #return @item
    end
  end

#Define Items Below#
#Items might be better as hashes?#
#short_sword = {name: "Short Sword", level: 1, strength: 5, stamina: 3}

#Make new 'Basic' items with low stats that character has equipped to begin with

  class ShortSword
    attr_reader :item_name, :level, :strength, :stamina, :quality
    def initialize
      #Assign stats to the item which can be used by the Character
      @item_name = "Short Sword"
      @level = 1
      @strength = 1
      @stamina = 1
      @quality = "Common"
    end

    def to_s
      puts
      puts "A short sword of Roman make. Sturdy and Dependable."
      puts
    end
  end

  class OakShield
    attr_reader :item_name, :level, :strength, :stamina, :quality
    def initialize
      @item_name = "Oak Shield"
      @level = 1
      @strength = 1
      @stamina = 1
      @quality = "Common"
    end
  end

  class ForestCloak
    attr_reader :item_name, :level, :dexterity, :stamina, :quality
    def initialize
      @item_name = "Forest Cloak"
      @level = 1
      @dexterity = 2
      @stamina = 1
      @quality = "Uncommon"
    end
  end

  def to_s
    print "#{item.item_name}"
  end

end

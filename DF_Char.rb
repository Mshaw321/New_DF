class Character
  attr_reader :name, :char_class, :sex, :exp, :stats, :level, :hit_check, :my_attack, :inventory
  attr_writer :inventory, :exp

  def initialize(name, char_class, sex)
    #set instance variables
    @name = name
    @sex = sex
    @exp = 0
    @level = 1
    @inventory = []
    #run roll_stats
    roll_stats(char_class)
  end

  def level_up(exp)
    #accept exp everytime it's run.
    @exp += exp
    puts
    puts "Your exp is: #{@exp}"
    puts
    case @exp
    when 100
      #2
      puts "You have reached level 2!"
      @level = 2
      #Find a better way to do this
      case self.char_class
      when "Soldier"
        self.stats[:strength] += 2
      when "Thief"
        self.stats[:dexterity] += 2
      when "Ranger"
        self.stats[:dexterity] += 2
      when "Ranger"
        self.stats[:wisdom] += 2
      end

    when 250
      #3
      @level = 3
    when 400
      #4
      @level = 4
    when 600
      #5
      @level = 5
    when 850
      #6
    when 1150
      #7
    when 1500
      #8
    when 1900
      #9
    when 2500
      #10
    end
    #run level up logic once certain criteria are met
  end

  def roll_stats(char_class)
    #initialize character stats based on random rolls
    #that favor the classes main stat
    case char_class
    when "S"
      #Soldier
      @char_class = "Soldier"
      @stats = {strength: 20, stamina: 20, dexterity: 10, wisdom: 10, luck: 5, armor: 5}
      @stats[:ap] = @stats[:strength]
      @stats[:health] = @stats[:stamina]
    when "T"
      #Thief
      @char_class = "Thief"
      @stats = {strength: 15, stamina: 15, dexterity: 25, wisdom: 10, luck: 8, armor: 5}
      @stats[:ap] = @stats[:dexterity]
      @stats[:health] = @stats[:stamina]
    when "M"
      #Mage
      @char_class = "Mage"
      @stats = {strength: 10, Stamina: 15, Dexterity: 10, Wisdom: 20, Luck: 5, armor: 5}
      @stats[:ap] = @stats[:wisdom]
      @stats[:health] = @stats[:stamina]
    when "R"
      #Ranger
      @char_class = "Ranger"
      @stats = {strength: 15, stamina: 15, dexterity: 20, wisdom: 10, luck: 5, armor: 5}
      @stats[:ap] = @stats[:dexterity]
      @stats[:health] = @stats[:stamina]
    end
  end

  def attack
    #contains attack logic based on random rolls
    #which are influenced by character stats
    @hit_check = 1 + rand(20)
    @my_attack = 1 + rand(self.stats[:ap]/2)
  end

  def to_s
    #outputs chars vital statistics
    puts
    puts
    puts "<>         Character Sheet:         <>"
    puts "<>" + "-" * 34 + "<>"
    puts
    puts "    Character Name: .......... #{self.name}"
    puts
    puts "    Character Sex: ............. #{self.sex}"
    puts
    puts "    Character Level: ........... #{self.level}"
    puts
    puts "<>" + "-" * 34 + "<>"
    puts
    puts "    Your [Class]: ...... #{self.char_class.inspect}"
    puts
    puts "    Your [Strength] is: ....... #{self.stats[:strength]}"
    puts
    puts "    Your [Stamina] is: ........ #{self.stats[:stamina]}"
    puts
    puts "    Your [Dexterity] is: ...... #{self.stats[:dexterity]}"
    puts
    puts "    Your [Wisdom] is: ......... #{self.stats[:wisdom]}"
    puts
    puts "    Your [Luck] is: ............ #{self.stats[:luck]}"
    puts
    puts "    Your [Health] is: ......... #{self.stats[:health]}"
    puts
    puts "<>" + "-" * 34 + "<>"
    puts
  end
end

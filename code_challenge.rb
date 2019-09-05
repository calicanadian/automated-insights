class Primp
  def initialize
    # ["1 hat", "2 pants", "3 shirt", "4 shoes", "5 socks"]
    @wearing = []
    @continue = true
  end

  def get_dressed(item_order)
    while @continue do
      @continue = false
      item_order.split().each do |item|
        result = put_on_item(item.to_i)
        puts result
        result == "fail" ? return : nil
      end
    end
  end

  def put_on_socks?
    return (@wearing.empty?) ? true : false
  end

  def put_on_pants?
    return (@wearing.include?(5) && !@wearing.include?(4)) ? true : false
  end

  def put_on_shoes?
    return (@wearing.include?(5) && @wearing.include?(2)) ? true : false
  end

  def put_on_shirt?
    return (!@wearing.include?(1)) ? true : false
  end

  def put_on_hat?
    return (@wearing.include?(3)) ? true : false
  end

  def dressed?
    return (@wearing & [5,2,3,4]).any?
  end

  def put_on_item(item)
    begin
      case item
      when 5
        if put_on_socks?
          @wearing << item
          @continue = true
          return "socks"
        else
          @continue = false
          return "fail"
        end
      when 4
        if put_on_shoes?
          @wearing << item
          @continue = true
          return "shoes"
        else
          @continue = false
          return "fail"
        end
      when 3
        if put_on_shirt?
          @wearing << item
          @continue = true
          return "shirt"
        else
          @continue = false
          return "fail"
        end
      when 2
        if put_on_pants?
          @wearing << item
          @continue = true
          return "pants"
        else
          @continue = false
          return "fail"
        end
      when 1
        if put_on_hat?
          @wearing << item
          @continue = true
          return "hat"
        else
          @continue = false
          return "fail"
        end
      when 6
        if dressed?
          @continue = false
          return "leave"
        else
          return "fail"
          @continue = false
        end
      end
    rescue Exception => error
      puts error.message
    end
  end
end

routine1 = Primp.new
routine2 = Primp.new
routine3 = Primp.new

puts "FIRST TEST"
routine1.get_dressed("5 1")
puts "SECOND TEST"
routine2.get_dressed("5 2 3 4 6")
puts "THIRD TEST"
routine3.get_dressed("5 2 3 1 4 6")

puts "Try it yourself..."
routine4 = Primp.new
user_input = gets.chomp
routine4.get_dressed(user_input)

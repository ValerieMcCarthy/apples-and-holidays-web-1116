require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  jackpot = nil
  holiday_hash.each do |key, value|
    if key == :summer
      value.each do |holiday, activity|
        if holiday == :fourth_of_july
          jackpot = activity[1]
        end
      end
    end
  end
  jackpot

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  holiday_hash.each do |key, value|
    if key == :winter
      value.each do |holiday, activity|
        activity << supply
      end 
    end
  end
  
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |key, value|
    if key == :spring
      value.each do |holiday, activity|
        activity << supply
      end 
    end
  end


end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  holiday_hash[season][holiday_name] = supply_array
  # remember to return the updated hash
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
    winter_supplies_array = []
    holiday_hash.each do |key, value|
    if key == :winter
      value.each do |holiday, activity|
        winter_supplies_array << activity
      end 
    end
  end
  winter_supplies_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
 holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.each do |holiday2, supply|

      holiday_split = []
      holiday_hold = []
      holiday_revised = holiday2.capitalize
      if holiday2["_"]
        holiday_split = holiday2.to_s
        holiday_split = holiday_split.split("_")
        holiday_split.each do |cap_word|
          holiday_hold << cap_word.capitalize
          end
          holiday_revised = holiday_hold.join(" ")
      end

      supply_array = []
      supply_string = 0 
        supply.each do |item|
          supply_array << item 
          end
      supply_string = supply_array.join(", ")
      puts "  " + "#{holiday_revised}: " + supply_string
    end
end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  all_holidays_bbq = []
  holiday_hash.each do |season, holiday|
      holiday.each do |key, value|
        if value.include? ("BBQ")
          all_holidays_bbq << key
        end
      end
    end
  
  all_holidays_bbq
end










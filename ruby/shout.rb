# OM, DBC 6.4

# **Learning about modules**

# Declaring a new module:

module Shout

  def yell_angrily(words)
      puts "#{words}" + "!!!" + " :("
  end

  def shout_out_loud(phrase)
    puts "Boldly declaring, #{(phrase)}!"
  end
end

class Paperboy
  include Shout
end

class Auctioneer
  include Shout
end

# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end
#   def self.yell_happily(words)
#     words + "!!!!" + " ^_^"
#   end
# end
#
# # Adding some driver code:
#
# Shout.yell_angrily("how can you")
#
# Shout.yell_happily("oh my goodness")

paperboy = Paperboy.new
paperboy.shout_out_loud("EXTRA, EXTRA! READ ALL ABOUT IT")
paperboy.yell_angrily("TERRIBLE NEWS")

auctioneer = Auctioneer.new
auctioneer.shout_out_loud("AAAAAND SOLD! To the highest bidder")
auctioneer.yell_angrily("No takers?")

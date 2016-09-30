# OM, DBC 6.4

# **Learning about modules**

# Declaring a new module:

module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end
  def self.yell_happily(words)
    words + "!!!!" + " ^_^"
  end
end

# Adding some driver code:

Shout.yell_angrily("how can you")

Shout.yell_happily("oh my goodness")

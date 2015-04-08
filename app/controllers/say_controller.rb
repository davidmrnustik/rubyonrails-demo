class SayController < ApplicationController
  def hello
    @time = Time.now
    @big = "BIG"
    @words = %w[ ant bee cat dog elk]
    @words[2] = 'nil'
    @files = Dir.glob('*')
    def wrap &b
      print "Santa says: "
      3.times(&b)
      print "\n"
    end
    wrap { print "Ho! " }
    
  end

  def goodbye
    @ble = "Tohle je ble"
    @now = Time.now
  end

  def ahoy
  end

  def something
    
  end

end

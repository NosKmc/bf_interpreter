class Brainfuck
  def initialize(src)
    @saddr = 0
    @maddr = 0
    @script = src.gsub(/\r\n|\r|\n|\s|\t/, "")
    @parpair = parse
    @rstack = []
    @mem = Array.new(30000,0)
  end

  def read()
    ord = @script[@saddr]
    return false if ord.nil?

    # > < + - . , [ ]
    case ord
    when ">"
      @maddr+=1
    when "<"
      @maddr-=1
    when "+"
      @mem[@maddr]+=1
    when "-"
      @mem[@maddr]-=1
    when "."
      print @mem[@maddr].chr
    when ","
      @mem[@maddr] = gets.to_i
    when "["
      if @mem[@maddr] == 0
        @saddr = @parpair[@saddr]
      else
        @rstack.push(@saddr)
      end
    when "]"
      @saddr = @rstack.pop - 1
    end

    @saddr+=1
    return true
  end

  def parse()
    l = @script.length
    rstack = []
    pars = {}
    
    l.times do |i|
      o = @script[i]
      case o
      when "["
        rstack.push(i)
      when "]"
        r = rstack.pop
        pars[r] = i
      end
    end
    pars
  end

  def run()
    loop do
      break unless read()
    end
  end
end


# print hoge
s=">+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++
++>-]<.>+++++++++++[<+++++>-]<.>++++++++[<+++>-]<.+++.------.--------.[-]>
++++++++[<++++>-]<+.[-]++++++++++."

bf = Brainfuck.new(s)
bf.run()

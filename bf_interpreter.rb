# coding: utf-8

class Brainfuck
  def initialize(src)
    @saddr = 0
    @maddr = 0
    @script = src.gsub(/\r\n|\r|\n|\s|\t/, "")
    @parpair = parse
    p @parpair #あとでけす
    @mem = Array.new(100,0)
  end

  def read()
    ord = @script[@saddr]
    return if ord.nil?
    @saddr+=1

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
    end
    
    read()
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
end


# print hoge
s="++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++
++++++++.
+++++++.
--------.
--."

bf = Brainfuck.new(s)
bf.read()

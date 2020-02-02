# coding: utf-8

class Brainfuck
  def initialize(src)
    @saddr = 0
    @maddr = 0
    @script = src.gsub(/\r\n|\r|\n|\s|\t/, "")
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

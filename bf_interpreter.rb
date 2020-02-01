# coding: utf-8

class Brainfuck
  def initialize(src)
    @saddr = 0
    @maddr = 0
    @script = src.gsub(/\r\n|\r|\n|\s|\t/, "")
    @mem = Array.new(1000)
  end

  def read()
    ord = @script[@saddr]
    return if ord.nil?
    @saddr+=1
    print ord
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

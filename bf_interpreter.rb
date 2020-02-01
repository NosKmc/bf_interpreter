# coding: utf-8

class Brainfuck
  def initialize(src)
    @ptr = 0
    @mema = 0
    @mem = []
    @script = src
  end
end

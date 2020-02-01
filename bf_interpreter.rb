# coding: utf-8

class Brainfuck
  def initialize(src)
    @saddr = 0
    @maddr = 0
    @script = src
    @mem = []
  end
end

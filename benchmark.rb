require 'benchmark'

ITERATIONS = 100

def add_to_end_of_list(aa)
  aa << 99
end

def add_to_middle_of_list(aa)
  aa.insert((aa.length / 2).floor, 99)
end

factor = 1
while factor < 1_000_000
  loops = ITERATIONS * factor
  factor = factor * 10

  a1 = []
  a2 = []

  start = Time.now
  loops.times do
    add_to_end_of_list(a1)
  end
  delta_append = Time.now - start
  puts delta_append * 1000.0

  start = Time.now
  loops.times do
    add_to_middle_of_list(a2)
  end
  delta_insert_in_middle = Time.now - start
  puts delta_insert_in_middle * 1000.0
  puts
end
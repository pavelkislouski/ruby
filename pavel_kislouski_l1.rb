# first task
def task1(input)
  # split output on string
  task1_result = []
  strs = input.split(/\n/)
  i = 0
  loop do
    if strs[i].include? 'error'
      task1_result << 'URGENCY!'
      task1_result << strs[i]
      i += 1
    end
    break if i == strs.size - 1
  end
  task1_result
end

def task2(input)
  # split output on string
  task2_result = []
  strs = input.split(/\n/)
  i = 0
  loop do
    unless strs[i].include? 'error'
      target_string = ''
      date = strs[i][/[0-9]{2}\/[a-zA-Z]+\/[0-9]{4}:\d{2}:\d{2}:\d{2} \+\d{4}/]
      target_string += date
      target_string += '  FROM: '
      ip_address = strs[i][/\d+\.\d+\.\d+\.\d+/]
      target_string += ip_address
      to = strs[i][/(?<=POST )\/.+\/.+\/.+\/.+\"/]
      to = to.upcase
      target_string += '  TO: '
      target_string += to
      task2_result << target_string
    end
    i += 1
    break if i == strs.size - 1
  end
  task2_result
end

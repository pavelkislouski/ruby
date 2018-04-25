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
    else
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
      task1_result << target_string
    end
    i += 1
    break if i == strs.size - 1
  end
  task1_result
end

# second task
def task2(input)
  # split output on string
  task2_result = []
  strs = input.split(/\n/)
  i = 0
  massive = []
  count_massive = 0

  loop do
    if strs[i].include? 'Calling'
      need_time = strs[i][/(?<=17:)\d{2}:\d{2}\.\d/]
      massive[count_massive] = need_time
      count_massive += 1
    end
    i += 1
    break if i == strs.size - 1
  end

  minute1 = massive[0][/\d{2}/].to_i * 60
  minute2 = massive[1][/\d{2}/].to_i * 60
  minute_res = minute2 - minute1

  sec1 = massive[0][/\d{2}\.\d/].to_f
  sec2 = massive[1][/\d{2}\.\d/].to_f
  second_res = sec2 - sec1

  # result
  task2_result << (minute_res + second_res).round(1)
  task2_result
end

# third task
def task3(input)
  summa = 0
  input.each_char { |c| summa += c.to_i }
  summa
end

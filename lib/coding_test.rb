module CodingTest

  def load_file(name)
    file = File.new("data/#{name}", "r")
    while (line = file.gets)
      yield(line)
    end
    file.close
  end

  def day_min_temp_spread(file_name)
    min_temp_variation = 100
    mtv_day = nil
    load_file(file_name) do |line|
      ln = line.split

      unless ln[0].nil?
        if ln[0].is_number?
          if ln[1].is_number? && ln[2].is_number?
            mtv_check = ln[1].to_i - ln[2].to_i
            if mtv_check < min_temp_variation
              min_temp_variation = mtv_check
              mtv_day = ln[0]
            end
          end
        end
      end
    end

    mtv_day
  end

  def team_min_point_spread(file_name)
    min_point_spread = 50
    team = nil
    load_file(file_name) do |line|
      ln = line.split

      unless ln[0].nil?
        if ln[0].gsub('.','').is_number?
          if ln[6].is_number? && ln[8].is_number?
            if ln[6].to_i > ln[8].to_i
              mps_check = ln[6].to_i - ln[8].to_i
            else
              mps_check = ln[8].to_i - ln[6].to_i
            end
            if mps_check < min_point_spread
              min_point_spread = mps_check
              team = ln[1]
            end
          end
        end
      end
    end

    team
  end

end

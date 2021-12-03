class Submarine
  def initialize(report)
    @report = report
  end

  def power_consumption
    gamma_rate = '0b'
    epsilon_rate = '0b'

    report = @report.split
    report.first.strip.length.times do |i|
      gamma_rate[i + 2] = common_bit(report, i)
      epsilon_rate[i + 2] = common_bit(report, i, 'least')
    end

    gamma_rate.to_i(2) * epsilon_rate.to_i(2)
  end

  def life_support_rating
    oxygen_generator_rating = '0b'
    co2_scrubber_rating = '0b'

    report = @report.split
    oxygen_result = report.dup
    co2_result = report.dup
    report.first.strip.length.times do |i|
      oxygen_result = calculate_result(oxygen_result, i, 'most')
      co2_result = calculate_result(co2_result, i, 'least')

      if oxygen_result.count == 1 && co2_result.count == 1
        oxygen_generator_rating += oxygen_result.first
        co2_scrubber_rating += co2_result.first
        break
      end
    end

    oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)
  end

  private

  def common_bit(input, bit = 0, dominant = 'most')
    return input.first[bit] if input.count == 1

    zeros = 0
    ones = 0

    input.each do |record|
      record.strip!
      zeros += 1 if record[bit].eql?('0')
      ones += 1 if record[bit].eql?('1')
    end

    most, least = zeros > ones ? %w(0 1) : %w(1 0)

    dominant.eql?('most') ? most : least
  end

  def calculate_result(result, i, dominant)
    common = common_bit(result, i, dominant)
    result.select do |o|
      o[i].eql?(common)
    end
  end
end

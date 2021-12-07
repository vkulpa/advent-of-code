class LanternFish
  def initialize(input)
    @input = input.split(',').map(&:to_i)
    @population = 0
    @cache = {}
  end

  def simulate(days)
    @input.each do |current|
      @population += calculate(current, days, 1)
    end
    self
  end

  def population
    @population
  end

  private
  def calculate(input, days, current_population)
    return @cache["#{input}:#{days}"] if @cache["#{input}:#{days}"]

    return current_population if days == 0

    if input == 0
      old_fish = calculate(6, days - 1, current_population)
      new_fish = calculate(8, days - 1, 1)
      @cache["6:#{days - 1}"] = old_fish
      @cache["8:#{days - 1}"] = new_fish
      return old_fish + new_fish
    end

    @cache["#{input - 1}:#{days - 1}"] = calculate(input - 1, days - 1, current_population)
  end
end
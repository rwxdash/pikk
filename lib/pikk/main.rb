require 'terminal-table/import'

module Pikk
  class << self
    def single_select(list = [{}])
      raise ArgumentError, 'Input is empty!' if list == [{}]

      arr = calculate_prob(list)

      selected_object = pick_from(arr)
      return selected_object
    end

    def pool(list = [{}], iteration: 50, pp: false)
      raise ArgumentError, 'Input is empty!' if list == [{}]
      $iteration = iteration

      arr = calculate_prob(list)

      $iteration.times do
        selected_object = pick_from(arr)
        selected_object[:count] += 1
      end

      pp ? to_table(arr) : arr.sort_by { |h| h[:weight] }.reverse
    end

    private

    def calculate_prob(list = [{}])
      tmp = []
      sum = list.map { |h| h[:weight] }.sum.to_f

      list.each do |hash|
        tmp << hash.merge({count: 0, probability: (hash[:weight] / sum)})
      end

      return tmp
    end

    def pick_from(list = [{}])
      index = 0
      r = rand(0.0...1.0);

      while r > 0
        r = r - list[index][:probability]
        index += 1 if r > 0
      end

      list[index]
    end

    def to_table(list = [{}])
      list.sort_by { |h| h[:weight] }.reverse!

      fsum = 0

      ftable = table do
        self.headings = "Name", "Weight", "Count", "Probability", "(C/(P*I))"

        list.each do |f|
          add_row [f[:name], f[:weight], f[:count], f[:probability], (f[:count].to_f/(f[:probability] * $iteration))]

          fsum += f[:count].to_f/(f[:probability] * $iteration)
        end
        add_separator
        add_row ['Total', { :value => (1 - fsum / list.count).abs, :colspan => 4, :alignment => :right }]
        align_column 1, :center
      end

      puts ftable
    end
  end
end

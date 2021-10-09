# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  attr_accessor :data

  NEWLINE = "\n"
  TAB = "\t"

  def row_to_table(headers, row)
    row.map.with_index { |cell, i| [headers[i], cell] }.to_h
  end

  def take_tsv(tsv)
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    headers = rows.first
    table_data = rows[1..]
    @data = table_data.map { |row| row_to_table(headers, row) }
    @data
  end

  def to_tsv
    keys = @data[0].keys.join(TAB)
    output = keys + NEWLINE
    @data.each do |line|
      output.concat(line.values.join(TAB))
      output.concat(NEWLINE)
    end
    output
  end
end

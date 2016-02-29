require 'csv'
require 'json'

namespace :data do
  task initial_load: :environment do
    filenames = [
      'ALL',
      'EBV-PTLD',
    ]

    indication = nil
    headers = nil

    filenames.each do |filename|
      CSV.foreach("data/#{filename}.csv") do |row|
        case $.
        when 1
          puts "processing #{row[0]}"
          indication = Indication.where(name: row[0]).first_or_create
        when 2
          headers = row
        else
          if $. == 3
            note_hash = Hash[headers[21..-1].zip(row[21..-1])]
            indication.update(
              notes: JSON.generate(note_hash),
            )
          end
          company = Company.where(name: row[2], ticker: row[3]).first_or_create
          drug = company.drugs.where(
            name: row[0],
            target: row[1],
            indication: indication,
          ).first_or_create

          trial_attributes = Hash[headers[5..19].zip(row[5..19])]

          trial = drug.trials.create(
            phase: row[4],
            attribute_blob: trial_attributes,
          )
        end
      end
    end
  end
end

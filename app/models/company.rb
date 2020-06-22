class Company < ApplicationRecord
  extend Pagy::Search

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Company.create({
                         name: row[0],
                         rfc: row[1],
                         situation: row[2]
                     })
    end
  end
end

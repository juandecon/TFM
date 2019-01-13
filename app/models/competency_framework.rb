class CompetencyFramework < ApplicationRecord
    has_many :competencies
    has_many :assignments, through: :competencies

    validates :name, presence: true
    def self.migrate
        params = { context: { contextid: 1 } }
        items = Api::CompetencyFramework.all(params)
        items.each do |item|
            cf = CompetencyFramework.find_or_initialize_by(moodle_id: item['id'].to_s)
            cf.name = item['shortname']
            cf.moodle_id = item['id'].to_s
            cf.moodle_contextid = item['contextid'].to_s
            cf.moodle_contextname = item['contextname'].to_s
            cf.moodle_idnumber = item['idnumber'].to_s
            cf.save
        end
    end
end

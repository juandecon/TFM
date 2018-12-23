class Competency < ApplicationRecord
  belongs_to :competency_framework
  validates :nombre, presence: true

  # Migrar Competencies desde Moodle
  # 
  # @param competency_framework_id String. ID del Competency Framework de Moodle.
  # Default 'all' para todos los registros.
  def self.migrate_all
    CompetencyFramework.find_each do |cf|
      migrate_one(cf.moodle_id)
    end
  end

  def self.migrate_one(moodle_competencyframeworkid = '0')
    cf = CompetencyFramework.find_by(moodle_id: moodle_competencyframeworkid.to_i)
    return if cf.nil?

    filters = { filters: [{ column: 'competencyframeworkid', value: cf.moodle_id }]}
    competencies = Api::Competency.all(filters)
    competencies.each do |item|
      c = Competency.find_or_initialize_by(moodle_id: item['id'].to_s)
      c.nombre = item['shortname'].to_s
      c.moodle_id = item['id'].to_s
      c.moodle_idnumber = item['idnumber'].to_s
      c.moodle_competencyframeworkid = item['competencyframeworkid'].to_s
      c.competency_framework = cf
      c.save
    end
  end
end

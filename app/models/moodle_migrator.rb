class MoodleMigrator

    def self.start
      init_at = DateTime.now
      self.clean
      self.migrate
      end_at = DateTime.now
  
      return {
        seconds: end_at.to_i - init_at.to_i,
        ịnit_at: init_at,
        end_at: end_at,
      }
    end
  
    def self.migrate
      CompetencyFramework.migrate
      Competency.migrate
      Course.migrate
      Assignment.migrate_grades
    end
  
    def self.clean
      Grade.destroy_all
      Student.destroy_all
      Assignment.destroy_all
      Course.destroy_all
      Competency.destroy_all
      CompetencyFramework.destroy_all
    end
  end
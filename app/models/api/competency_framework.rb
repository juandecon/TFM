module Api
    class CompetencyFramework
  
      # Llamada a funcion core_competency_list_competency_frameworks
      #
      # Ej: params = { context: { contextid: 1 } )
      #
      # @params params Hash
      # - :context Object (requerido)
      #   - contextid: Integer
      #   - contextlevel: String
      #   - instanceid: Integer
      # - :sort String. Nombre de columna. Default 'shortname'
      # - :order String. (ASC|DESC)
      # - :skip Integer. Saltar una cantidad de registros dada. Default 0
      # - :limit Integer. Cantidad de elementos por consulta. Default 0
      # - :includes String (children|parents|self)
      # - :onlyvisible Integer (0|1)
      # - :query String
      def self.all(params = {})
        Moodle::Api.core_competency_list_competency_frameworks(params)
      end
    end
  end 
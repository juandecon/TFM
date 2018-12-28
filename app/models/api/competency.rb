module Api
    class Competency
  
      # Llamada a la función API core_competency_list_competencies
      # 
      # Ej: params = { filters: [{ column: 'competencyframeworkid', value: '1' }]}
      # 
      # @param params Hash
      # - :filters Array[Object] (Requerido). Donde Object tiene la forma { column: String, value: String } 
      # - :sort String. Columna de ordenación
      # - :order String (ASC|DESC)
      # - :skip Integer. Salta un numero de registro en la petición
      # - :limit Integer. Cantidad de elementos por petición
      def self.all(params = {})
        Moodle::Api.core_competency_list_competencies(params)
      end
    end
  end 
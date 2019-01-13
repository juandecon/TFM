ActiveAdmin.register_page 'Consolidado' do
    menu label: 'Cualificación profesional'
    menu priority: 10
  
    page_action :execute, method: :post do
      #operations = MoodleMigrator.start
      #flash[:notice] = "El proceso se ha completado en #{operations[:seconds].to_i} seg."
      #redirect_to admin_migrate_path
    end
  
    content title: 'Informe de cualificación profesional' do
      @report_result = Report.consolidado
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: "Informe de cualificación profesional")
        names = []
        students_count = []
        cupos_disponibles = []
      
        @report_result.each do |k, item|
          necesario = " (#{(item[:students_count] - item[:empresas_cupos_disponibles])})"
          names << item[:competency_framework_name] + necesario
          students_count << item[:students_count]
          cupos_disponibles << item[:empresas_cupos_disponibles]
        end
  
        f.xAxis(categories: names)
        f.series(name: "Cupos disponibles", yAxis: 0, data: cupos_disponibles)
        f.series(name: "Cantidad de estudiantes", yAxis: 1, data: students_count)
         
        f.yAxis [
          {title: {text: "Cupos disponibles", margin: 50 }  },
          {title: {text: "Cantidad de estudiantes", margin: 50}, opposite: true },
        ]
      
        f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'horizontal')
        f.chart({defaultSeriesType: "column"})
      end
      render partial: 'index', locals: { chart: @chart }
    end
  end
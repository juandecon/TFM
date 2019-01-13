ActiveAdmin.register_page 'Migrate'  do
  menu priority: 11
  menu label: 'Migración de datos'
  page_action :execute, method: :post do
    operations = MoodleMigrator.start
    flash[:notice] = "El proceso se ha completado en #{operations[:seconds].to_i} segundos."
    redirect_to admin_migrate_path
  end

  content title: 'Migración de datos' do
    render partial: 'index'
  end

  sidebar 'Aviso' do
    "Una vez iniciado el proceso, por favor, espere a que la página se recargue automáticamente."
  end
end
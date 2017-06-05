namespace :examples do
  desc 'Generates 5 example machine categories'
  task generate_machine_categories: :environment do
    5.times { |i| MachineCategory.new(name: "Categoría #{i}").save }
    puts 'Generated 5 example machine categories.'
  end

  desc 'Generates 5 example machine sections'
  task generate_machine_sections: :environment do
    5.times { |i| MachineSection.new(name: "Sección #{i}").save }
    puts 'Generated 5 example machine sections.'
  end

  desc 'Run all example generator tasks'
  task all: :environment do
    Rake::Task['examples:generate_machine_categories'].execute
    Rake::Task['examples:generate_machine_sections'].execute
  end
end

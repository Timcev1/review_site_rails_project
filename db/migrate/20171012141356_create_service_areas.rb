class CreateServiceAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :service_areas do |t|
      t.string :name
      t.integer :job_id

      t.timestamps
    end
  end
end

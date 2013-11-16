class CreateRiskSummaries < ActiveRecord::Migration
  def change
    create_table :risk_summaries do |t|
      t.references :project

      t.timestamps
    end
    add_attachment :risk_summaries, :riskfile
    add_index :risk_summaries, :project_id
  end
end

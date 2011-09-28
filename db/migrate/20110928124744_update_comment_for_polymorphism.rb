class UpdateCommentForPolymorphism < ActiveRecord::Migration
  def self.up
    remove_column :comments, :article_id
    add_column :comments, :subject_id, :integer
    add_column :comments, :subject_type, :string
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

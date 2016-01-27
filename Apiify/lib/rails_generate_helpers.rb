module RailsGenerateHelpers
  def rails_g_model_migration(name)
    exec("rails g model #{name} #{attributes} --no-test-framework")
  end

  def rails_g_controller(path)
    exec("rails g controller #{path} --no-helper --no-assets --no-controller-specs --no-view-specs --no-template-engine --no-test-framework")
  end
end

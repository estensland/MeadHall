require '~/coding/MeadHall/Apiify/lib/apiify.rb'

# VAR directory of rails_app
# VAR model name
pluralized_name = model_name.pluralized
classify_name = model_name.classify
# VAR controller/#{WHAT}/
# VAR Attrs
# VAR stringified_attrs
# VAR safe_params override
# VAR controller_path





# make model and migration
exec("rails g model #{classify_name} #{stringified_attrs} --no-test-framework")


# make controller
exec("rails g controller #{controller_path} --no-helper --no-assets --no-controller-specs --no-view-specs --no-template-engine --no-test-framework")


# ############
# # Open controller and add [routes, safe_params] change ApplicationController to ApiController
# ##########


# ############
# # Create Factory if not existing
# ##########

# ############
# # Create Rspec specs for model if not existing, (auto spec associations)
# ##########



# ############
# # Create Rspec specs for controller, auto test the given routes
# ##########



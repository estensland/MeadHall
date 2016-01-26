# VAR directory of rails_app
# VAR model name
# VAR puralized model name
# VAR classified model name
# VAR controller/#{WHAT}/
# VAR Attrs
# VAR safe_params override
# VAR controller_path



# make model and migration
rails g model garfield name:string cool:boolean --no-test-framework


# make controller
rails g controller #{controller_path} --no-helper --no-assets --no-controller-specs --no-view-specs --no-template-engine --no-test-framework


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



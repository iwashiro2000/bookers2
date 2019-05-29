class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource_or_scop)
		user_path(current_user)
	end

	def after_sign_out_path_for(resource_or_scop)
		root_path
	end

	# def user_logged_in?
	# 	!! session[:user_id]
	# 	if session[:user_id]
	# 	begin
	# 		@current_user = User.find_by(user_id: session[:user_id])
	# 	resouce ActiveRcord::RecordNotFound
	# 		reset_user_session
	# 	end
	# end
	# return if @current_user
	# 	flash[:referer] = request.fullpath
	# 	redirect_to login_index_path
	# end

	# def reset_user_session
	# 	session[:user_id] = nill
	# 	@current_user = nill
	# end


	protected


	# def redirect_url
	# 	 new_user_session_path
	# end

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:email])
	end
	# private

	# def sing_in_required
	# 	redirect_to new_user_session_url unless user_signed_in?
	# end
end

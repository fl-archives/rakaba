class AuthController < ApplicationController
	def login
		for_anonymous
		return not_found if not request.post?
		password 	= Digest::MD5.hexdigest(SALT + params[:user][:password])
		user 			= User.find_by_password(password)
		if user
			return render(text: root_url)
		else
			return render(text: t('error.wrong_password'))
		end
	end

	def logout
		for_logged_in
		cookies.delete(:rakaba_session)
		@session.delete
		return redirect_to(:root)
	end

	def register
		for_anonymous
		if request.post?
			password = params[:user][:password]
			if password.length < 6
				return render(text: t('error.short_password'))
			else
				password = Digest::MD5.hexdigest(SALT + password)
				user = User.create(password: password)
				set_session(user.id)
				return render(text: url_for(:root))
			end
		end
	end

	private
	def set_session id
		key = 		Digest::MD5.hexdigest(rand.to_s + SALT)
		key += 		Digest::MD5.hexdigest(rand.to_s + SALT)
		Session.create(key: key, user_id: id)
		cookies['rakaba_session'] = {
			value: 		key,
			path: 		root_path,
			expires: 	Time.new + 99999999
		}
	end

	def for_logged_in
		if anonymous?
			return redirect_to(:root)
		end
	end

	def for_anonymous
		if not anonymous?
			return redirect_to(:root)
		end
	end
end

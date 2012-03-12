class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  def setup
    @auth_token = session[:auth_token]
    @auth_secret = session[:auth_secret]
    @username = session[:username]

    @user = User.find_by_username(session:twitter_username)
    if @user.nil?
      redirect_to new_user_url
    end

    session[:uid] = @user.id
    update
  end

  def index
    redirect_to home_index_url
    # @users = User.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @users }
    # end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @auth_token = session[:auth_token]
    @auth_secret = session[:auth_secret]
    @username = session[:username]

    if @username.empty? or @auth_token.empty? or @auth_secret.empty?
      redirect_to '/auth/twitter'
    end

    @user = User.new(:username => @username, :auth_token => @auth_token,
                     :auth_secret => @auth_secret)
    # @user.update_attribute :username, @username
    # @user.update_attribute :auth_token, @auth_token
    # @user.update_attribute :auth_secret, @auth_secret

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    unless User.find_by_username(session[:username]).nil?
      redirect_to 'users#update'
      return
    end
    @user = User.new(params[:user])

    logger.info "*** USER CONTROLLER: create"
    logger.info "*** USER: #{@user}"
    logger.info "*** USER: #{@user.username}"
    logger.info "*** USER: #{@user.auth_token}"
    logger.info "*** USER: #{@user.auth_secret}"
    logger.info "*** USER: #{@user.sms}"

    respond_to do |format|
      if @user.valid? and @user.save
        session[:uid] = @user.id
        format.html { redirect_to home_index_url, 
                      notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(session[:uid])
    @user.update_attribute :auth_token, session[:auth_token]
    @user.update_attribute :auth_secret, session[:auth_secret]
    @user.save!

    redirect_to home_index_url

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

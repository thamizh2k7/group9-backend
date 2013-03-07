class Api::V1::SessionsController < Devise::SessionsController  
  def create  
    respond_to do |format|  
      format.html { super }  
      format.json {  
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")  
        render :status => 200, :json => { :error => "Success" }  
      }  
    end  
  end  
  def destroy  
    super  
  end  

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end
end 
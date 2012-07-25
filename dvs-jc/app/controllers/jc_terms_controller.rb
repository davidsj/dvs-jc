class JcTermsController < ApplicationController
  # GET /jc_terms/1
  # GET /jc_terms/1.json
  def show
    @jc_term = JcTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @jc_term }
    end
  end

  # GET /jc_terms/new
  # GET /jc_terms/new.json
  def new
    @jc_term = JcTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @jc_term }
    end
  end

  # POST /jc_terms
  # POST /jc_terms.json
  def create
    @jc_term = JcTerm.new(params[:jc_term])

    respond_to do |format|
      if @jc_term.save
        format.html { redirect_to @jc_term, :notice => 'JC term was successfully created.' }
        format.json { render :json => @jc_term, :status => :created, :location => @jc_term }
      else
        format.html { render :action => "new" }
        format.json { render :json => @jc_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jc_terms/1
  # DELETE /jc_terms/1.json
  def destroy
    @jc_term = JcTerm.find(params[:id])
    @jc_term.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end

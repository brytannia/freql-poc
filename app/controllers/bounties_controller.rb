class BountiesController < ApplicationController
  def new
    @bounty = Bounty.new
  end

  def create
    create_operation
    redirect_to @bounty
  end

  def show
    @bounty = Bounty.find(params[:id])
  end

  private

  def create_operation
    validated_params = params.to_unsafe_hash[:bounty]
    master = User.create(username: validated_params[:master][:username])
    url_crash = validated_params[:issue_url].partition('/issues/')
    repo = url_crash[0].gsub('https://github.com/', '')
    repo = repo.partition('/')[2]
    project = Project.create(name: repo, repo_url: url_crash[0], main_lang: Lang.first)
    issue = Issue.create(project: project, lang: Lang.first, desc_url: validated_params[:issue_url], status: 0, name: url_crash[2], publisher: master)
    @bounty = Bounty.create(master: master, issue: issue, sum: validated_params[:sum])
  end
end
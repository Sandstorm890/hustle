class ToolsController < ApplicationController

    def index
        @tools = Tool.all
    end

    def update
        tool = current_tool
        if tool.users.include?(current_user)
            tool.users.delete(current_user)
            current_user.tools.delete(current_tool)
        else
            tool.users << current_user
            current_user.tools << tool
            tool.save
            current_user.save
        end
        redirect_to tools_path
    end

    private

    def current_tool
        @tool = Tool.find_by(id: params[:id])
    end


end
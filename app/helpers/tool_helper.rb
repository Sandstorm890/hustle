module ToolHelper

    def current_tool
        @tool = Tool.find_by(id: params[:id])
    end

end
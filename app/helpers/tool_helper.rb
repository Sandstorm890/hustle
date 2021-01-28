module ToolHelper

    def current_tool
        @tool = Tool.find_by(id: params[:id])
    end

    def tool_owned?(tool)
        current_user.tools.include?(tool)
    end
end
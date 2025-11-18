module ApplicationHelper
   def flash_class(type)
    case type
    when 'notice' then 'alert alert-success'    # 成功の場合のクラス
    when 'alert' then 'alert alert-danger'       # エラーの場合のクラス
    else 'alert alert-info'                      # その他の場合のクラス
    end
  end
end

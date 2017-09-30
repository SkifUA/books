module ApplicationHelper
  def alerts
    alert = flash[:notice] || flash[:error] || flash[:alert]
    if alert
      alert_generator(alert)
    end
  end

  def alert_generator(msg)
    js add_gritter(msg, title: "Test Website", sticky: false)
  end
end

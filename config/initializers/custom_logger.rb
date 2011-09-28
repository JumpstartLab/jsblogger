module Kernel
  @@audit_log = ActiveSupport::BufferedLogger.new("log/audit.log")
  def audit(message)
    preamble = "\n[#{caller.first}] at #{Time.now}\nMessage: "
    @@audit_log.add 0, preamble + message.inspect
  end
end
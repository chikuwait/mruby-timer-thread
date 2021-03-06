module Timer
  class POSIX
    def interval?
      s = __status_raw
      s["interval.sec"] != 0 || s["interval.nsec"] != 0
    end

    def stopped?
      s = __status_raw
      s["value.sec"] == 0 && s["value.nsec"] == 0
    end

    def seconds_left
      s = __status_raw
      s["value.sec"] + s["value.nsec"] / 1_000_000_000.0
    end

    def inspect
      "#<Timer::POSIX signo=#{self.signo.inspect}, clock_id=#{self.clock_id}, running=#{self.running?}, interval timer=#{self.interval?}>"
    rescue
      "#<Timer::POSIX !not available on this platform>"
    end

    alias run start
  end
end

{
  myUser,
  ...
}:
{
  systemd = {
    timers."eww-open" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 0:00:00";
        Persistent = true;
        Unit = "eww-open.service";
      };
    };

    services."eww-open" = {
      script = ''
        eww open notification
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "${myUser}";
      };
    };

    timers."eww-close" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 6:00:00";
        Persistent = true;
        Unit = "eww-close.service";
      };
    };

    services."eww-close" = {
      script = ''
        eww close notification
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "${myUser}";
      };
    };
  };
}

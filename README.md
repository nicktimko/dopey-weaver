# Dopey Weaver

*Canned provisioning for (hopefully) easier Python development on Windows*

## Requirements

1. Install [VirtualBox][virtbox]

1. Install [Vagrant][vagrant]

1. Install [Git][gitscm]

1. Put Git's `ssh.exe` onto your PATH

    * You can optionally use a dumb shim like below (placed elsewhere, but
      somewhere that is on the PATH with the name "`ssh.bat`") if you
      don't want to put the whole Git `bin` onto your PATH.

            "C:\Program Files (x86)\Git\bin\ssh.exe" %*

<hr>

**Do**cker, **Py**thon, **Wi**ndows, **Va**grant...dopy,
wiva...dopey...whatever. Who are you, Comrade Questions?

## Running

Build and run a Vagrant machine using `vagrant up` from a command line at the
project root, then connecting via `vagrant ssh` (requires an `ssh` program
on the path, see above).



[virtbox]: https://www.virtualbox.org/
[vagrant]: https://www.vagrantup.com/
[gitscm]: https://git-scm.herokuapp.com/

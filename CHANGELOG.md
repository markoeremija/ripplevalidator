# ripplevalidator changelog
The bigger part of Ripple validator Docker code was kept from Wietse Wind's
code from GitHub (https://github.com/WietseWind/docker-rippled-validator).

# Ideas to improve Dockerfile

1. Add WORKDIR directive (WORKDIR /keystore) to take away creation of two directories
in entrypoint script.
2. Order packages needed in alphabetic order for better visibility.
3. Suggest removing SSH package from first RUN directive.
4. Maybe move mkdir command (for .ripple directory) from entrypoint script to the
first RUN directive.
5. Use LABEL directive instead of MAINTAINER (deprecated).
6. Update syntax to comply to new Docker engine
(docker run vs docker container run etc.) and update "How to use this?".
7. Maybe map db files to a local filesystem (NuDB files).

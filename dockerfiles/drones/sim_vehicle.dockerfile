FROM dev_base

WORKDIR /

RUN git clone --recurse-submodules -b Copter-4.1.5 https://github.com/ArduPilot/ardupilot

RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ardupilot
RUN chmod 0440 /etc/sudoers.d/ardupilot

RUN chown -R ${USER}:${USER} /ardupilot

WORKDIR /ardupilot

USER ${USER}
RUN Tools/environment_install/install-prereqs-ubuntu.sh -y

RUN pip install \
        empy \
        future \
        mavproxy \
        pymavlink

# Set the buildlogs directory into /tmp as other directory aren't accessible
ENV BUILDLOGS=/tmp/buildlogs
ENV CCACHE_MAXSIZE=1G

RUN ./waf configure --board sitl && ./waf

# Cleanup
RUN sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/ardupilot/Tools/autotest/sim_vehicle.py", "--no-rebuild"]

CMD ["-v", "ArduCopter", "--console", "--map"]
FROM dev_base as builder

WORKDIR /mission_planner
ADD https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip mp.zip

RUN sudo chmod 777 mp.zip 
RUN unzip mp.zip -d /mission_planner/files

FROM mono

WORKDIR /mission_planner
COPY --from=builder /mission_planner/files /mission_planner

ENTRYPOINT [ "mono", "MissionPlanner.exe" ]

ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-focal"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

COPY ./src/ubuntu/install/prism $INST_SCRIPTS/prism/
# RUN chmod +x $INST_SCRIPTS/prism/prism.AppImage
# RUN chmod 755 $INST_SCRIPTS/prism/prism.AppImage





USER root

COPY ./src/ubuntu/install/prism/custom_startup.sh $STARTUPDIR/custom_startup.sh
RUN chmod +x $STARTUPDIR/custom_startup.sh
RUN chmod 755 $STARTUPDIR/custom_startup.sh

# Update the desktop environment to be optimized for a single application
# RUN cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN cp /usr/share/extra/backgrounds/bg_kasm.png /usr/share/extra/backgrounds/bg_default.png
RUN apt-get remove -y xfce4-panel
## install java 8 ##
COPY ./src/ubuntu/install/prism/jre-8u351.tar.gz /usr/java/jre-8u351.tar.gz
WORKDIR /usr/java
RUN tar -xf /usr/java/jre-8u351.tar.gz
WORKDIR $HOME

# RUN chmod +x $INST_SCRIPTS/prism/installprism.sh
# RUN chmod 755 $INST_SCRIPTS/prism/installprism.sh
# RUN $INST_SCRIPTS/prism/installprism.sh

######### End Customizations ###########

RUN chown 1000:1000 $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME 

RUN chmod +x $INST_SCRIPTS/prism/installprism.sh
RUN chmod 755 $INST_SCRIPTS/prism/installprism.sh
# COPY ./src/ubuntu/install/prism/prism.AppImage /home/kasm-user/prism.AppImage
RUN cp -r $INST_SCRIPTS/prism/ /home/kasm-user/prism
RUN $INST_SCRIPTS/prism/installprism.sh
# RUN chmod +x /home/kasm-user/prism/prism.AppImage
RUN chmod +x $INST_SCRIPTS/prism/install.sh
WORKDIR /home/kasm-user/prism/prism-p/bin
RUN unzip prismlauncher.zip
WORKDIR $HOME
RUN apt install -y firefox
RUN chown -R 1000:1000 $HOME
USER 1000
# RUN rm -rf /home/kasm-user/Desktop/
# RUN $INST_SCRIPTS/prism/install.sh
# RUN $INST_SCRIPTS/prism/prism.AppImage

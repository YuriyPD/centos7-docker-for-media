FROM scratch
ADD centos-7-x86_64-docker.tar.xz /
CMD ["/bin/bash"]
WORKDIR /
RUN yum update -y
RUN yum install -y svn wget libva libva-devel zlib-devel centos-release-scl scl-utils 
RUN yum install -y devtoolset-7
RUN scl enable devtoolset-7 bash
RUN wget https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/p/python2-scons-3.1.2-1.el7.noarch.rpm
RUN rpm -Uvh python2-scons-3.1.2-1.el7.noarch.rpm 
RUN rm python2-scons-3.1.2-1.el7.noarch.rpm
RUN yum install -y valgrind-devel.x86_64 libdrm-devel.x86_64
RUN wget https://www.obj-sys.com/rlmDL/rlmutil_lnx64.tar.gz
RUN tar -xf rlmutil_lnx64.tar.gz
RUN rm rlmutil_lnx64.tar.gz
RUN mv rlmutil rlmhostid
RUN mkdir -p project/rlm/last/x64_l1
RUN mv rlmhostid project/rlm/last/x64_l1/
RUN ln -s /project /10vu

